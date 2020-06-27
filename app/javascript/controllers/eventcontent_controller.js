import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["content", 'card'];
    static values = { url: String };

    events() {
        if (this.hasContentTarget) {
            console.log(`has content target ${this.contentTarget}`);
            this.contentTarget.classList.remove("invisible");
        } else {
            console.log(this.data.get("url-value"));
            fetch(this.data.get("url-value"))
                .then((r) => r.text())
                .then((html) => {
                    const fragment = document
                        .createRange()
                        .createContextualFragment(html);

                    this.element.appendChild(fragment);
                });
        }
    }
    toggle() {
        this.contentTargets.forEach((t) =>
            t.classList.toggle(this.data.get("class"))
        );
    }
    shadow() {
        this.cardTargets.forEach((target) =>
            target.classList.toggle("shadow")
        );
    }

    hide() {
        if (this.hasContentTarget) {
            this.contentTarget.classList.add("invisible");
        }
    }

    disconnect() {
        console.log(`inside disconnect`);
        if (this.hasContentTarget) {
            this.contentTarget.remove();
        }
    }
}
