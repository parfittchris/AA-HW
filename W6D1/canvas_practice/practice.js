document.addEventListener("DOMContentLoaded", function(){
    const canvas = document.getElementById('mycanvas');
    canvas.width = 500;
    canvas.heigth = 500;
    const ctx = canvas.getContext('2d');

    //Square
    ctx.fillStyle = "blue";
    ctx.fillRect(50,50,50,50);
   

    //Circle
    ctx.beginPath();
    ctx.arc(100, 100, 20, 0, 2 * Math.PI, true);
    ctx.strokeStyle = "red";
    ctx.lineWidth = 3;
    ctx.stroke()
    ctx.fillStyle = 'purple';
    ctx.fill();

    //Triangle
    ctx.beginPath()
    ctx.moveTo(100, 50);
    ctx.lineTo(150, 50);
    ctx.lineTo(125, 75);
    ctx.lineTo(100,50);
    ctx.fillStyle = 'yellow';
    ctx.fill()
    ctx.strokeStyle = 'green';
    ctx.lineWidth = 3;
    ctx.stroke()
});
