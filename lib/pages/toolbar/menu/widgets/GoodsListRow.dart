import 'package:color_dart/color_dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_luckin_coffee/pages/toolbar/menu/commonUI.dart';
import 'package:flutter_luckin_coffee/utils/index.dart';

class GoodsListRow extends StatelessWidget {
  final String imgSrc;
  final String title;
  final String desc;
  final String recomment;
  final double price;
  final bool border;
  final String activeDesc;

  GoodsListRow({
    this.title = "",
    this.imgSrc = "",
    this.recomment,
    this.desc,
    this.price = 20,
    this.border = true,
    this.activeDesc
  });

  /// 商品信息中的文本
  /// 
  /// ```
  /// @param {String} title - 标题
  /// @param {double} fontSize 
  /// @param {FontWeight} fontWeight 
  /// @param {Color} color 
  /// ```
  Widget row(String title, {
    double fontSize = 11, 
    FontWeight fontWeight,
    Color color}) {
      return Row(children: <Widget>[
        Expanded(child: 
          Text(title, style: TextStyle(
              color: color == null ? rgba(166, 166, 166, 1) : color,  
              fontSize: fontSize, 
              fontWeight: fontWeight == null ? FontWeight.normal : fontWeight
            ),
          ),
        )
      ],
    );
  }

  /// 商品图片
  Widget goodsImg(String imgSrc) {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(4.0),
      child: Image.asset(
        imgSrc, 
        width: 70, 
        height: 70, 
        fit: BoxFit.cover,
      )
    );
  }

  ///活动信息
  Widget activeMsg({String text}) {
    return text == null ? Container() : Positioned(
      right: 0,
      bottom: 5,
      child: Container(
        height: 16,
        padding: EdgeInsets.symmetric(horizontal: 4),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.circular(2.0),
          color: rgba(255, 129, 2, 1)
        ),
        child: Text(
          text,
          style: TextStyle(
            color: hex('#fff'),
            fontSize: 8
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(child: 
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: ui.borderBottom(show: border),
          ),
          child: Row(
            children: <Widget>[
              Container(
                width: 80,
                height: 70,
                child: Stack(children: <Widget>[
                  Positioned(child: goodsImg(imgSrc),),
                  
                  activeMsg(text: activeDesc)
                ],),
              ),

              Expanded(
                child: Container( 
                margin: EdgeInsets.only(left: 6),
                child: Column(
                  children: <Widget>[
                    row(title, 
                      color: rgba(56, 56, 56, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                    row(desc == null ? " " : desc),
                    row(recomment == null ? " " : recomment),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("¥ $price", style: TextStyle(
                              color: rgba(56, 56, 56, 1), 
                              fontSize: 15, 
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          icontubiao(color: rgba(136, 175, 213, 1))
                        ],
                      ),
                    )
                  ],
                ),
              ), 
            ),
          ],),
        ),
      )
    ],);
  }
}



 