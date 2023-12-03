import { LightningElement } from 'lwc';
import insertDataHeroku from '@salesforce/apex/InsertDataHeroku.InsertData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class NightlyButton extends LightningElement {

    handleClick() {
        insertDataHeroku()
            .then(result => {
                this.showToast('Éxito', 'Datos importados exitosamente desde Heroku', 'success');
            })
            .catch(error => {
                this.showToast('Error', `Hubo un error al importar datos: ${error.body.message}`, 'error');
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



