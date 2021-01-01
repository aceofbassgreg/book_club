console.log("SUCCESS");

const addBook = ()=> {
  console.log("clicked");
  const createButton = document.getElementById("addBook");
  createButton.addEventListener("click", () => {
    const lastId = document.querySelector('#fieldsetContainer').lastElementChild.id;

    const newId = parseInt(lastId, 10) + 1;

    if (newId <= 5) {

      const newFieldset = document.querySelector('[id="0"]').outerHTML.replace(/0/g,newId);

      document.querySelector("#fieldsetContainer").insertAdjacentHTML(
          "beforeend", newFieldset
      );
    };
  });
}
export { addBook };
