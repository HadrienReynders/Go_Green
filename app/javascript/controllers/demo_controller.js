import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["modal"];

    launchDemo() {
        let modalController = this.application.getControllerForElementAndIdentifier(
            this.modalTarget,
            "modal"
        );
        modalController.open();
    }
}
