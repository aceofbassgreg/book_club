const removeFieldset = ()=> {
  // Case #1: Initial page load, only one Remove Book button
  const removeButton = document.getElementsByClassName("removeFieldset")[0];
  removeButton.addEventListener("click", () => {
    if ( document.querySelector("#fieldsetContainer").childElementCount === 1 ) {
      const descendents = removeButton.parentElement.getElementsByTagName("*");
      for (let descendent of descendents) {
        if (descendent.tagName === "INPUT") {
          descendent.value = ""
        }
      }
    }
  })

  // Case #2: User has added more books by clicking "Add more books"
  const createButton = document.getElementsByClassName("addFieldset")[0];
  createButton.addEventListener("click", () => {
    const removeButtons = document.getElementsByClassName("removeFieldset");
    for (let element of removeButtons) {
      element.addEventListener("click", () => {
        const fieldset = element.parentElement;
        if ( document.querySelector("#fieldsetContainer").childElementCount === 1 ) {
          const descendents = fieldset.getElementsByTagName("*");
          for (let descendent of descendents) {
            if (descendent.tagName === "INPUT") {
              descendent.value = ""
            }
          }
        } else {
          fieldset.remove();
        }
      })
 }})
};
export { removeFieldset };
