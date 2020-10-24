<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="systemNumberTest10.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Самостоятельная работа по системам счисления</title>
    <style type="text/css">
        .auto-style1 {
            width: 60px;
        }
    </style>
</head>
<body>
    <div id="main">
    <div id="work">
    
    <p style="border:2px dotted red;">Вы можете использовать этот тест для тренировки умения переводить в различные системы счисления.<br /> 
        Тест можно выполнять несколько раз (если это не контрольная работа). После ввода ответов нажмите кнопку "Проверить". Чтобы получить оценку за работу,<br />
        выполните работу на сайте и в тетради. 
        В тетради нужно продемонстрировать умение решать задачи, а не просто показать ответы.</p>
        <h1>Самостоятельная работа по системам счисления</h1>
    <p>Введите свою имя и фамилию<br> (если тренируетесь, то вводить не обязательно):<br/>    
    <input type="text" value="" id="textFIO" style="width: 500px;"/>
        <select id="Select1" class="auto-style1" name="D1">
            <option>8А</option>
            <option>8Б</option>
            <option>9А</option>
            <option>9Б</option>
            <option>10А</option>
            <option>10Б</option>
            <option>10В</option>
            <option>11А</option>
            <option>11Б</option>
            <option>11В</option>
        </select><p>1. Переведите из 10 системы счисления в 2 систему счисления число:<b><span id="task1"></span></b></p>
    <input type="text" value="" id="text1"/><br/>
    <p>2. Переведите из 10 системы счисления в 8 систему счисления число:<b><span id="task2"></span></b></p>
    <input type="text" value="" id="text2"/><br/>
    <p>3. Переведите из 10 системы счисления в 16 систему счисления число:<b><span id="task3"></span></b></p>
    <input type="text" value="" id="text3"/><br/>
    <p>4. Переведите из 2 системы счисления в 10 систему счисления число:<b><span id="task4"></span></b></p>
    <input type="text" value="" id="text4"/><br/>
    <p>5. Переведите из 8 системы счисления в 10 систему счисления число:<b><span id="task5"></span></b></p>
    <input type="text" value="" id="text5"/><br/>
    <p>6. Переведите из 16 системы счисления в 10 систему счисления число:<b><span id="task6"></span></b></p>
    <input type="text" value="" id="text6"/><br/>
        <p>7. Переведите из 10 системы счисления в 7 систему счисления число:<b><span id="task7"></span></b></p>
    <input type="text" value="" id="text7"/><br/>
    <p>8. Переведите из 5 системы счисления в 10 систему счисления число:<b><span id="task8"></span></b></p>
    <input type="text" value="" id="text8"/><br/>
    <p>9. Перевести из байтов в Килобайты:<span id="task9"></span></p>
    <input type="text" value="" id="text9"/><br/>
    <p>10. Перевести из Кбайтов в байты:<span id="task10"></span></p>
    <input type="text" value="" id="text10"/><br/>
    <p>11. Перевести из римской системы счисления в десятичную систему счисления:<span id="task11"></span></p>
    <input type="text" value="" id="text11"/><br/>
    <p>12. Перевести из десятичной системы счисления в римскую систему счисления:<span id="task12"></span></p>
    <input type="text" value="" id="text12"/><br/>
             Окончание самостоятельной работы
      <hr />
    <button onclick="checkIt()">ПРОВЕРИТЬ</button>

    </div>
            
        <p id="checkText">


    </p>
    </div>

<script>
    
window.onload=testFill;

var q=[],ta=[],n=12,results;//count tasks

function checkIt()
{
    results=""
    var a = [], tf = [], ball = 0;

    //for(var i=0;i<n;i++)
      //  q[i]=document.getElementById("task"+(i+1)).value;    
    for(var i=0;i<n;i++)
        a[i]=document.getElementById("text"+(i+1)).value;    
    //alert(a)
    for (var i = 0; i < n; i++)
        if (a[i]!=undefined && a[i].toString().toUpperCase() == ta[i].toString().toUpperCase()) { tf[i] = 1; ball++; } else {
            tf[i] = 0;
        };

    var checkText = document.getElementById("checkText");
   // var r = document.getElementById("result");
    checkText.innerHTML = "<br>Name:" + document.getElementById("textFIO").value + "<br>";
    results += document.getElementById("textFIO").value + "<br>"
    results+=document.getElementById("Select1").value+"<br>"
    checkText.innerHTML += "Results:<br>"
   // r.value += "<br>Работу выполнил:" + document.getElementById("textFIO").value + "<br>";
    for (var i = 0; i < n; i++)
    {
        checkText.innerHTML += (i + 1) +". Question:"+q[i]+ ". Your answer: " + a[i]+". Correct answer:"+ta[i] + ". Balls:" + tf[i] + "<br>";

        results = results  + tf[i] + "<br>";
    }
    //alert(results);
    checkText.innerHTML += "Total:" +  ball;
    results += ball + "<br>";//+ document.getElementById("work").innerHTML;
    //alert(results);
    document.cookie = "results_zaa=" + results;//checkText.innerHTML;
    document.cookie = "FIO_zaa=" + document.getElementById("textFIO").value;
    //document.getElementById("data2").value = results;
    form1.data2.value = results;
    //document.getElementById("work").innerHTML = "";
    document.getElementById("ServerDiv").style.visibility = "visible";
    //document.getElementById("btnSend").style.visibility = "visible";
    //document.getElementsByName("btnSend").style.visibility = "visible";
    //document.getElementById("NameOf").value = textFIO.value;
    //document.getElementById("Balls").value = ball;
   // document.getElementById("Label1").innerText = ball;

}
    
    
function testFill()
{
    document.getElementById("ServerDiv").style.visibility = "hidden";
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
    q[8] = +randomNumber(1, 10) * 1024;
    ta[8] = q[8]/1024;
    q[9] = +randomNumber(1, 10);
    ta[9] = q[9] * 1024
    ta[10] = +randomNumber(1000, 2000);
    q[10] = DecToRoman(ta[10]);
    q[11] = +randomNumber(1000, 2000);
    ta[11] = DecToRoman(q[11]);
    //alert(q[12]);
    for(var i=0;i<n;i++)
        document.getElementById("task" + (i + 1)).innerHTML = q[i];
    //document.getElementById("btnSend").visibility = "hidden";
}
    
    function BytesToKBytes(b) {
        return b / 1024
    }

    function КBytesToBytes(b) {
        return b * 1024
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

    function DecToRoman(number) {
  let roman = {
    "M": 1000,
    "CM": 900,
    "D": 500,
    "CD": 400,
    "C": 100,
    "XC": 90,
    "L": 50,
    "XL": 40,
    "X": 10,
    "IX": 9,
    "V": 5,
    "IV": 4,
    "I": 1
  };
  let result = "";

  for (var i of Object.keys(roman)) {
    var repeat = Math.floor(number / roman[i]);
    number -= repeat * roman[i];
    result += i.repeat(repeat);
  }

  return result;
    }

</script>
    <div id="ServerDiv">
    <form id="form1" runat="server">
        <asp:Button ID="btnSend"  runat="server" Text="Отправить результаты учителю" Width="204px" OnClick="Button1_Click" UseSubmitBehavior="True"  />
        <br />
    <p id="data" runat="server" />
    <asp:HiddenField ID="data2" runat="server" />
    </form>
    </div>
        <asp:Label ID="lblStatus" runat="server" />
</body>
</html>
