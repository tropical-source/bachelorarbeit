const test3 = () => {
  fetch("https://jsonplaceholder.typicode.com/albums")
    .then((response) => {
      if (response.ok) {
        return response.json();
      } else {
        return Promise.reject(response);
      }
    })
    .then((data) => {
      // build list
      ul = document.getElementById("list");
      data.forEach((item) => {
        let li = document.createElement("li");
        ul.appendChild(li);
        li.innerHTML += item.title;
      });
    })
    .catch((err) => {
      // There was an error
      console.warn("Something went wrong.", err);
    });
};
