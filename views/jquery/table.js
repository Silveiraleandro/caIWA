/*<Mikhail Timofeev> (<16 September – 02 December>) <Web applications/XML,jquery, XSL, CSS, JavaScript>Code provider can be found at https://moodle.cct.ie/ .*/
function draw_table()
{
	$("#results").empty();
	$.getJSONuncached = function (url)
	{
		return $.ajax(
		{
			url: url,
			type: 'GET',
			cache: false,
			success: function (html)
			{
				$("#results").append(html);
				select_row();
			}
		});
	};
	$.getJSONuncached("/get/html")
};

function select_row()
{
	$("#menuTable tbody tr[id]").click(function ()
	{
		$(".selected").removeClass("selected");
		$(this).addClass("selected");
		var section = $(this).prevAll("tr").children("td[colspan='4']").length - 1;
		var entree = $(this).attr("id") - 1;
		delete_row(section, entree);
	})
};

function delete_row(sec, ent)
{
	$("#delete").click(function ()
	{
		$.ajax(
		{
			url: "/post/delete",
			type: "POST",
			data:
			{
				section: sec,
				entree: ent
			},
			cache: false,
			success: setTimeout(draw_table, 1000)
		})
	})
};

$(document).ready(function ()
{
	draw_table();
});
function verifyForm() {
    var player = document.forms["nbaForm"]["player"].value;
    var value = document.forms["nbaForm"]["value"].value;
    var team = document.forms["nbaForm"]["team"].value;
    if (player == "") {
        alert("you must provide player position, name, value and a team!");
        return false;
    }
    else if (value == "") {
        alert("you must provide player position, name, value and a team!");
        return false;
    }
    else if (team == "") {
        alert("you must provide player position, name, value and a team!");
        return false;
    }
}
