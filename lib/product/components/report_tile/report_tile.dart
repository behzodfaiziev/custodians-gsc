// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../models/report/report_model.dart';

class ReportTile extends StatelessWidget {
  const ReportTile({
    required this.report,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final ReportModel report;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color : Color(0xFFECECEC),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),),
          
          elevation: 4,
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.network(
                  report.imageUrl ?? '',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(top :8.0),
                  child: Text(
                    report.title ?? '',
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons
                              .location_on,size: 16), 
                          SizedBox(
                              width:
                                  12), 
                          Text(
                            report.location ?? '',style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons
                              .watch_later,size: 16), 
                          SizedBox(
                              width:
                                  12), 
                          Text(
                            report.date ?? '',style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Icon(Icons
                              .person,size: 16), 
                          SizedBox(
                              width:
                                  12), 
                          Text(
                            report.createdBy ?? '',style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
