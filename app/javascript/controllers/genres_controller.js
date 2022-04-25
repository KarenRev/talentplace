import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ['genre', 'ids'];
  connect(){
    console.log('connected');
    console.log(this.genreTargets);
  }
  change(event){
    console.log(event);
    const selected = [];
    this.genreTargets.forEach((target) => {
      if (target.checked) {
        selected.push(target.value);
      }
    })
    this.idsTarget.value = selected.join(',');
  }
}
