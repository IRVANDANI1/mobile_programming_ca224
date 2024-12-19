import 'dart:developer';

import 'package:mobile_programming_ca224/core/helpers/database_helper.dart';
import 'package:mobile_programming_ca224/models/comment.dart';

import '../contracts/abs_comment_repository.dart';

class DbCommentRepository extends AbsCommentRepository {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<void> addComment(Comment newComment) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi insert data
      await db.insert(
        DatabaseHelper.tableComments,
        newComment.toMap(),
      );
    } catch (e) {
      log(e.toString(), name: 'DbCommentRepository:addComment');
    }
  }

  @override
  Future<void> deleteComment(String commentId) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi delete data
      await db.delete(
        DatabaseHelper.tableComments,
        where: 'id = ?',
        whereArgs: [commentId],
      );
    } catch (e) {
      log(e.toString(), name: 'DbCommentRepository:deleteComment');
    }
  }

  @override
  Future<List<Comment>> getAllComments(String momentId) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi membaca semua data berdasarkan momentId
      final result = await db.query(
        DatabaseHelper.tableComments,
        where: 'moment_id = ?',
        whereArgs: [momentId],
      );
      // Mengonversi hasil ke bentuk list object comment
      final comments = result.map((item) => Comment.fromMap(item)).toList();
      // Mengembalikan hasil dalam bentuk list
      return comments;
    } catch (e) {
      log(e.toString(), name: 'DbCommentRepository:getAllComments');
      return [];
    }
  }

  @override
  Future<Comment?> getCommentById(String commentId) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi membaca data berdasarkan id
      final result = await db.query(
        DatabaseHelper.tableComments,
        where: 'id = ?',
        whereArgs: [commentId],
      );
      // Konfirmasi apakah data ditemukan
      if (result.isEmpty) {
        return null;
      }
      // Mengonversi hasil ke bentuk object comment
      final comment = Comment.fromMap(result.first);
      // Mengembalikan hasil dalam bentuk object
      return comment;
    } catch (e) {
      log(e.toString(), name: 'DbCommentRepository:getCommentById');
      return null;
    }
  }

  @override
  Future<void> updateComment(Comment updateComment) async {
    try {
      // Akses database
      final db = await databaseHelper.database;
      // Melakukan operasi update data
      await db.update(
        DatabaseHelper.tableComments,
        updateComment.toMap(),
        where: 'id = ?',
        whereArgs: [updateComment.id],
      );
    } catch (e) {
      log(e.toString(), name: 'DbCommentRepository:updateComment');
    }
  }
}
