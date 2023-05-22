<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
</head>
<body>
  <style>
    .chat-content { height: 350px; overflow-y: scroll;}
    .line { margin-top: 10px; display: flex;}
    .chat-box {background: #eee; padding: 5px; max-width: 200px;}
    .mine {margin-left: auto;}
  </style>
  <div class="chat-content">
    <div class="line">
      <span class="chat-box">안녕?</span>
    </div>
    <div class="line">
      <span class="chat-box mine">안녕!</span>
    </div>
  </div>
  <input class="chat-box" id="input">
  <button id="send">전송</button>

  <script type="text/javascript">
    document.querySelector('#send').addEventListener('click', function(){
      var template = '<div class="line">\n' +
        '        <span class="chat-box mine">${ request.getParameter("input") }</span>\n' +
        '      </div>';
      document.querySelector('.chat-content').insertAdjacentHTML('beforeend', template);

      var apiKey = "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";
      var model = "text-davinci-003";
      var promptText = document.querySelector('#input').value+"for Korean";
      var temperature = 0.7;
      var maxTokens = 256;
      var topP = 1;
      var frequencyPenalty = 0;
      var presencePenalty = 0;

      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState === 4 && this.status === 200) {
          var result = JSON.parse(this.responseText);
          console.log(result.choices[0].text);
          var responseTemplate = '<div class="line">\n' +
            '          <span class="chat-box">' + result.choices[0].text + '</span>\n' +
            '        </div>';
          document.querySelector('.chat-content').insertAdjacentHTML('beforeend', responseTemplate);
        }
      };
      xhttp.open("POST", "https://api.openai.com/v1/completions", true);
      xhttp.setRequestHeader("Content-type", "application/json");
      xhttp.setRequestHeader("Authorization", "Bearer " + apiKey);
      xhttp.send(JSON.stringify({
        model: model,
        prompt: promptText,
        temperature: temperature,
        max_tokens: maxTokens,
        top_p: topP,
        frequency_penalty: frequencyPenalty,
        presence_penalty: presencePenalty
      }));
    });
  </script>

</body>
</html>