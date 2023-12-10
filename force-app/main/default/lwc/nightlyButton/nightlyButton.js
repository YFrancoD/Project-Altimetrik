// nightButton.js (Lightning Web Component)

import { LightningElement } from 'lwc';
import insertDataHeroku from '@salesforce/apex/InsertDataHeroku.InsertData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class NightlyButton extends LightningElement {
    // Método que se ejecuta al hacer clic en el botón
    handleClick() {
        // Llama al método Apex para importar datos desde Heroku
        insertDataHeroku()
            .then(result => {
                // Muestra un mensaje de éxito si la operación tiene éxito
                this.showToast('Éxito', 'Datos importados exitosamente desde Heroku', 'success');
            })
            .catch(error => {
                // Muestra un mensaje de error más informativo
                this.showToast('Error', `Hubo un error al importar datos: ${error.body.message || 'Error desconocido'}`, 'error');
            });
    }

    // Método para mostrar mensajes de tostada
    showToast(title, message, variant) {
        const toastEvent = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(toastEvent);
    }
}
