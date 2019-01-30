function sortTable(n) {
  var table;
  var rows;
  var switching;
  var i;
  var x;
  var y;
  var shouldSwitch;
  var sortBy;
  var switchCount = 0;

  table = document.getElementById("myTable");
  switching = true;
/*set the order to ascending */
  sortBy = "asc";

  while (switching) {

    switching = false;
    rows = table.rows;

    for (i = 1; i < (rows.length - 1); i++) {

      shouldSwitch = false;

      x = rows[i].getElementsByTagName("td")[n];
      y = rows[i + 1].getElementsByTagName("td")[n];

      if (sortBy == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {

          shouldSwitch= true;
          break;
        }
      } else if (sortBy == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {

          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {

      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;

      switchCount ++;
    } else {

/* if the order is not set to ascending th*/
      if (switchCount == 0 && sortBy == "asc") {
        sortBy = "desc";
        switching = true;
      }
    }
  }
}
