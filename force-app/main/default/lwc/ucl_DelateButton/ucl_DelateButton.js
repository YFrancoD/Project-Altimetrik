import { LightningElement } from 'lwc';
import ucl_DelateRecords from '@salesforce/apex/ucl_DelateRecords.Delate';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Ucl_DelateButton extends LightningElement {
    handleClick() {
        ucl_DelateRecords()
            .then(result => {
                this.showToast('Éxito', 'Se han borrado todos los registros exitosamente', 'success');
            })
            .catch(error => {
                this.showToast('Error', `Hubo un error al borrar datos: ${error.body.message}`, 'error');
            });
    }

    showToast(title, message, variant) {
        const toastEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(toastEvent);
    }

}