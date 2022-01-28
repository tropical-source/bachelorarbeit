window.localStorage.clear();

const startTest = () => {
  var time = 0;

  fetch("../generated.json")
    .then((res) => res.json())
    .then((json) => {
      let t0 = performance.now();
      json.forEach((e) => {
        window.localStorage.setItem(e.key, e.value);
      });
      time = performance.now() - t0;
      console.log(time);
      const p = document.getElementById("result");
      p.innerHTML += `${time}`;
    });
};

startTest();
