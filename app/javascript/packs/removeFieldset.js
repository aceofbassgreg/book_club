const removeFieldset = ()=> {
  // Case #1: Initial page load, or books are pre-loaded
  const removeButtons = document.getElementsByClassName("removeFieldset");
  for (let element of removeButtons) {
    element.addEventListener("click", () => {
      if (removeButtons.length == 1) {
        const descendents = element.parentElement.getElementsByTagName("*");
        for (let descendent of descendents) {
          if (descendent.tagName === "INPUT") {
            descendent.value = ""
          }
        }
      } else {
        const fieldset = element.parentElement;
        fieldset.remove()
      }
    })
  };

  // Case #2: User has added more bookks (and more removeButtons) by clicking "Add more books"
  const createButton = document.getElementsByClassName("addFieldset")[0];
  createButton.addEventListener("click", () => {
  const removeButtons = document.getElementsByClassName("removeFieldset");
  for (let element of removeButtons) {
    element.addEventListener("click", () => {
      if (removeButtons.length == 1) {
        const descendents = element.parentElement.getElementsByTagName("*");
        for (let descendent of descendents) {
          if (descendent.tagName === "INPUT") {
            descendent.value = ""
          }
        }
      } else {
        const fieldset = element.parentElement;
        fieldset.remove()
      }
    })
  };
})};
export { removeFieldset };
