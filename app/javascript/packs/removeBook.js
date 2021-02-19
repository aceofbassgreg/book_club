const removeBook = ()=> {
  // Case #1: Initial page load, only one Remove Book button
  const removeButton = document.getElementsByClassName("removeBook")[0];
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
  const createButton = document.getElementById("addBook");
  createButton.addEventListener("click", () => {
    const removeButtons = document.getElementsByClassName("removeBook");
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
export { removeBook };
