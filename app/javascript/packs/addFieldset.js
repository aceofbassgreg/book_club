const addFieldset = ()=> {
  const createButton = document.getElementsByClassName("addFieldset")[0];
  createButton.addEventListener("click", () => {
    const lastId = document.querySelector('#fieldsetContainer').lastElementChild.id;

    const newId = parseInt(lastId, 10) + 1;

    if (newId <= 9) {

      const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/id="0"/g,"id=" + newId);

      document.querySelector("#fieldsetContainer").insertAdjacentHTML(
          "beforeend", newFieldset
      );
    };
  });
}
export { addFieldset };
