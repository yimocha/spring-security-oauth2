第一步：获取授权码
http://localhost:8080/oauth/authorize?client_id=client&response_type=code

第二步：根据授权码申请令牌
http://client:secret@localhost:8080/oauth/token
grant_type=authorization_code
code=1JuO6V

第三步：携带令牌访问资源服务器
http://localhost:8081/contents?access_token=8828dd19-8a7b-4682-8b24-79282d3a6e05
