const md5 = require('md5');
//引入body-parse中间件
const bodyParser = require('body-parser');
//引入express模块
const express=require('express');
//引入mysql模块
const mysql=require('mysql');
// 引入cors模块
const cors=require('cors');
//创建web服务器
const app=express();

//设置端口
app.listen(3000);
app.use(cors({
  origin:['http://127.0.0.1:8080','http://localhost:8080','http://localhost:8081']
}));
//使用中间件
app.use(bodyParser.urlencoded(
	{extended:false}
));

//连接数据库
const pool=mysql.createPool({
	host:'127.0.0.1',
	port:'3306',
	user:'root',
	password:'',
	database:'photo',
	connectionLimit:10
});
console.log("server is runing...");

//接口
app.post('/phone',(req,res)=>{
	// const password = req.body.password;
	// const phoneData = this.ReginForm.tel;
	const phone = req.body.phone;
	let sql = 'SELECT id FROM log_author WHERE phone=?';
	//console.log(111111);
	pool.query(sql,[phone],(err,results)=>{
		if(err) throw err;
		if(results.length == 1){
			res.send({message:"获取数据成功",code:1,info:results[0]})
		}else{
			res.send({message:"获取数据失败",code:0})
		}
	})
})
////////////////////////////////////////////////

//用户注册的的接口
app.post('/registerPhone',(req,res)=>{
    //接受用户以post方式提交的数据
    let phone = req.body.phone;
    let password = req.body.password;
    //console.log(username,password);
    let sql = 'SELECT id FROM log_author WHERE phone=?';
    pool.query(sql,[phone],(err,results)=>{
        if(err) throw err;
        if(results.length == 0){
            //将相关的信息写入到xzqa_author中
<<<<<<< HEAD
            sql = 'INSERT INTO log_author(phone,password) VALUES(?,MD5(?))';
=======
            sql = 'INSERT INTO log_author(phone,password) VALUES(?,md5(?))';
>>>>>>> 01ba8dc... 摄影之家第二次提交
            pool.query(sql,[phone,password],(err,results)=>{
                if(err) throw err;
                res.send({message:'注册成功',code:1});
            });
        } else {
            //产生合理的错误信息到客户端
            res.send({message:'该手机号已被注册',code:0})
        }
    })

})

//用户注册的的接口
app.post('/register',(req,res)=>{
    //接受用户以post方式提交的数据
    let username = req.body.username;
    let password = req.body.password;
    //console.log(username,password);
    let sql = 'SELECT id FROM log_author WHERE username=?';
    pool.query(sql,[username],(err,results)=>{
        if(err) throw err;
        if(results.length == 0){
            //将相关的信息写入到xzqa_author中
<<<<<<< HEAD
            sql = 'INSERT INTO log_author(username,password) VALUES(?,MD5(?)';
=======
            sql = 'INSERT INTO log_author(username,password) VALUES(?,md5(?))';
>>>>>>> 01ba8dc... 摄影之家第二次提交
            pool.query(sql,[username,password],(err,results)=>{
                if(err) throw err;
                res.send({message:'注册成功',code:1});
            });
        } else {
            //产生合理的错误信息到客户端
            res.send({message:'用户名已存在',code:0})
        }
    })

})

//获取登录的接口
app.post('/login',(req,res)=>{
	let username = req.body.username;
	let password = md5(req.body.password);
	let sql = 'SELECT id,username FROM log_author WHERE username=? AND password=?';
	pool.query(sql,[username,password],(err,results)=>{
		if(err) throw err;
		if(results.length == 1){
			res.send({message:"登录成功",code:1,info:results[0]})
		}else{
			res.send({message:"登录失败",code:0})
		}
	})
})
//获取登录的接口
app.post('/loginPhoto',(req,res)=>{
	let phone = req.body.phone;
	let password = md5(req.body.password);
	console.log(phone,password);
	let sql = 'SELECT id,phone FROM log_author WHERE phone=? AND password=?';
	pool.query(sql,[phone,password],(err,results)=>{
		if(err) throw err;
		if(results.length == 1){
			res.send({message:"登录成功",code:1,info:results[0]})
		}else{
			res.send({message:"登录失败",code:0})
		}
		console.log(results);
	})
})

//获取文章类型接口
app.get('/category',(req,res)=>{
  let sql='SELECT id,category_name FROM log_category insc ORDER BY id ASC';
  // 通过MySQL连接池执行sql语句
  pool.query(sql,(err,result)=>{
		if(err) throw err;
    res.send({message:'查询成功！',code:1,result:result});
  });
})

app.get('/lists',(req,res)=>{
	let cid=req.query.cid;
	// let page=req.query.page;
  // let pageSize=15;
  // let offset=(page-1)*pageSize;

	// console.log(cid);
	let sql='SELECT DISTINCT log_author.id AS aid,log_info.id,nickname,avatar,title,image,created_at FROM log_author INNER JOIN log_info ON  log_info.author_id=log_author.id INNER JOIN log_category ON log_info.category_id=?';
	if(cid!=0){
		pool.query(sql,[cid],(err,result)=>{
			if(err) throw err;
			// console.log(result);
			res.send({message:'查询成功！',code:1,result:result});
		});
	}else{
		let sql='SELECT log_author.id,log_info.id,nickname,avatar,title,image,created_at FROM log_author INNER JOIN log_info ON log_author.id=log_info.author_id';
		pool.query(sql,(err,result)=>{
			if(err) throw err;
			res.send({message:'查询成功！',code:1,result:result});
		});
	}
});

//获取特定文章(详情)接口
app.get('/details',(req,res)=>{
	//获取文章ID
	let id=req.query.id;
	//SQL查询
	let sql='SELECT log_info.id,title,content,image,views,likes,nickname,avatar,log_number,created_at  FROM log_info INNER JOIN log_author ON log_author.id=log_info.author_id WHERE log_info.id=?';
	pool.query(sql,[id],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result[0]});
	});
});
//获取个人信息主页接口
app.get('/me',(req,res)=>{
	//获取文章ID
	let id=req.query.id;
	//SQL查询
<<<<<<< HEAD
	let sql='SELECT nickname,log_number,avatar,views,likes FROM log_author INNER JOIN log_info ON log_author.id=log_info.author_id WHERE log_author.id=?;';
	pool.query(sql,[id],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result[0]});
	});
});

//获取个人信息主页接口
app.get('/me',(req,res)=>{
	//获取文章ID
	let id=req.query.id;
	//SQL查询
	let sql='SELECT nickname,log_number,avatar,views,likes FROM log_author INNER JOIN log_info ON log_author.id=log_info.author_id WHERE log_author.id=?;';
=======
	let sql='SELECT nickname,log_number,avatar,views,likes FROM log_author INNER JOIN log_info ON log_author.id=log_info.author_id WHERE log_author.id=?';
>>>>>>> 01ba8dc... 摄影之家第二次提交
	pool.query(sql,[id],(err,result)=>{
		if(err) throw err;
		res.send({message:'查询成功',code:1,result:result[0]});
	});
});