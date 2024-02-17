import 'package:flutter/material.dart';

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
          color : const Color(0xFFECECEC),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),),
          
          elevation: 4,
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              ClipRRect(
                borderRadius: const BorderRadius.only(
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
                          const Icon(Icons
                              .location_on,size: 16), 
                          const SizedBox(
                              width:
                                  12), 
                          Text(
                            report.location ?? '',style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const Icon(Icons
                              .watch_later,size: 16), 
                          const SizedBox(
                              width:
                                  12), 
                          Text(
                            report.date ?? '',style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          const Icon(Icons
                              .person,size: 16), 
                          const SizedBox(
                              width:
                                  12), 
                          Text(
                            report.createdBy ?? '',style: const TextStyle(fontSize: 12),
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
