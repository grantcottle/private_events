import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["card"];
    static values = { url: String };

    show() {
        if (this.hasCardTarget) {
            this.cardTarget.style.visibility="initial";
        } else {
            fetch(this.data.get('url-value'))
                .then((r) => r.text())
                .then((html) => {
                    const fragment = document
                        .createRange()
                        .createContextualFragment(html);

                    this.element.appendChild(fragment);
                });
        }
    }

    hide() {
        if (this.hasCardTarget) {
            this.cardTarget.style.visibility="hidden";
        }
    }

    disconnect() {
        console.log(`inside disconnect`)
        if (this.hasCardTarget) {
            this.cardTarget.remove();
        }
    }
}
