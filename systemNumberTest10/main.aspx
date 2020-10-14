<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="systemNumberTest10.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="main">
    <div id="work">
    
    <p style="border:2px dotted red;">Вы можете использовать этот тест для тренировки умения переводить в различные системы счисления. Когда ответите на все вопросы <b>позовите учителя. </b><br> <span style="color:red;">ВНИМАНИЕ!!!</span> <br>Если нажать "Проверить" без присутствия учителя баллы не будут засчитаны<br>
    </p>
        <h1>Самостоятельная работа по системам счисления</h1>
    <p>Введите свою имя и фамилию<br> (если тренируетесь, то вводить не обязательно):<br>    <hr>
    <input type="text" value="" id="textFIO" style="width: 500px;">
    
	<p>1. Переведите из 10 системы счисления в 2 систему счисления число:<b><span id="task1"></span></b></p>
    <input type="text" value="" id="text1"><br>
    <p>2. Переведите из 10 системы счисления в 8 систему счисления число:<b><span id="task2"></span></b></p>
    <input type="text" value="" id="text2"><br>
    <p>3. Переведите из 10 системы счисления в 16 систему счисления число:<b><span id="task3"></span></b></p>
    <input type="text" value="" id="text3"><br>
    <p>4. Переведите из 2 системы счисления в 10 систему счисления число:<b><span id="task4"></span></b></p>
    <input type="text" value="" id="text4"><br>
    <p>5. Переведите из 8 системы счисления в 10 систему счисления число:<b><span id="task5"></span></b></p>
    <input type="text" value="" id="text5"><br>
    <p>6. Переведите из 16 системы счисления в 10 систему счисления число:<b><span id="task6"></span></b></p>
    <input type="text" value="" id="text6"><br>
        <p>7. Переведите из 10 системы счисления в 7 систему счисления число:<b><span id="task7"></span></b></p>
    <input type="text" value="" id="text7"><br>
    <p>8. Переведите из 5 системы счисления в 10 систему счисления число:<b><span id="task8"></span></b></p>
    <input type="text" value="" id="text8"><br>
    <button onclick="checkIt()">Проверить</button>
    </div>
    <p id="checkText">
       
    </p>
    </div>
<script>
    
window.onload=testFill;

var q=[],ta=[],n=8;//count tasks
    
function checkIt()
{
    var a=[],tf=[],ball=0;
    for(var i=0;i<n;i++)
        q[i]=document.getElementById("task"+(i+1)).value;    
    for(var i=0;i<n;i++)
        a[i]=document.getElementById("text"+(i+1)).value;    
    
    for(var i=0;i<n;i++)
    
        if (a[i]==ta[i]) {tf[i]=1;ball++;} else tf[i]=0; 
    var checkText=document.getElementById("checkText");
    checkText.innerHTML="<br>Работу выполнил:"+document.getElementById("textFIO").value+"<br>";
    checkText.innerHTML+="Результаты:<br>"
    
    for(var i=0;i<n;i++)
          checkText.innerHTML+=(i+1)+". Дан ответ: "+a[i]/*+". Правильный ответ:"+ta[i]*/+". Баллов:"+tf[i]+"<br>";
    checkText.innerHTML+="Всего баллов:"+ball;
   document.getElementById("work").innerHTML="";
     
}
    
    
function testFill()
{
    q[0]=+randomNumber(10,100);
    ta[0]=DecToBinInt(q[0]);
    q[1]=+randomNumber(30,200);
    ta[1]=DecToAnyInt(q[1],8);
    q[2]=+randomNumber(100,255);
    ta[2]=DecToAnyInt(q[2],16);
    ta[3]=+randomNumber(10,50);
    q[3]=DecToBinInt(ta[3]);
    ta[4]=+randomNumber(30,100);
    q[4]=DecToAnyInt(ta[4],8);
    ta[5]=+randomNumber(101,255);
    q[5]=DecToAnyInt(ta[5],16);
    
    q[6]=+randomNumber(10,100);    
    ta[6]=DecToAnyInt(q[6],7);
    ta[7]=+randomNumber(10,200);    
    q[7]=DecToAnyInt(ta[7],5);    
    
    for(var i=0;i<n;i++)
      document.getElementById("task"+(i+1)).innerHTML=q[i];
}
    

    
function DecToMachineBin(n,digits)
{
  var r,r1="";
  
  if (n>=0) {
      r=DecToBinInt(Math.abs(n));
      r=r.toString().padStart(8,'0');
      return r;
  }
  else
  {
      r=DecToBinInt(Math.abs(n)-1);
      r=r.toString().padStart(8,'0');
      for(var i=0;i<r.length;i++)
          r1=r1+((r.charAt(i)=='0')?'1':'0');
      return r1;
  }
}
    

function DecToBinInt(a)
{
    var s="";
    while (a!=0) {
        s=a%2+s;
        a=parseInt(a/2);
        }
    return s;
}

	function DecToAnyInt(a,b)//число основание
	{
		var hex=[0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F'];
		var s="";
		while (a!=0) {
			s=hex[a%b]+s;
			a=parseInt(a/b);
			}
		return s;
	}
    
	function randomNumber (m,n)
	{
	  m = parseInt(m);
	  n = parseInt(n);
	  return Math.floor( Math.random() * (n - m + 1) ) + m;
	}
	
</script>
	

<div></div>
    </form>
</body>
</html>
