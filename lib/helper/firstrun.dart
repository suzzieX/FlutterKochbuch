import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';


// jup haben wir sicher anders gelernt ... sorry


  Future<bool> firstrun()  async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
   await  Future.delayed(const Duration(seconds: 2));
    if(prefs.getBool('initialized')??false) {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => recipe(),));
      return Future<bool>.value(true);
    }  else {
       try{
        final database = openDatabase('db.db');
        final db = await database;
        await db.execute("CREATE TABLE Categories (id INTEGER, name TEXT)");
        await db.execute("CREATE TABLE Images (id INTEGER, text TEXT, img BLOB)");
        await db.execute("CREATE TABLE Ingredients (id INTEGER, text TEXT, img BLOB)");

        prefs.setBool('initialized', true);
        return Future<bool>.value(true);
      } catch(e) {return Future<bool>.value(false);}
    }

  }
