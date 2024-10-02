import 'package:flutter/material.dart';
import 'package:girman/models/user.dart';

class UserListItem extends StatelessWidget {
  final User user;
  const UserListItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 3,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 24, 20, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundImage: NetworkImage(user.profileImg),
                  ),
                ],
              ),
              SizedBox(height: 14),
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 6),
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    size: 14,
                  ),
                  SizedBox(width: 6),
                  Text(
                    '${user.address}',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.phone,
                              size: 15,
                              color: Colors.black,
                            ),
                            SizedBox(width: 4),
                            Text(
                              user.phoneNumber,
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 3),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: Text(
                            'Available on phone',
                            style: TextStyle(fontSize: 11, color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showCustomDialog(context, user);
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        textStyle: TextStyle(fontSize: 12)),
                    child: Text('Fetch Details'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showCustomDialog(BuildContext context, User user) {
  showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          height: 380,
          margin: EdgeInsets.symmetric(horizontal: 40),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Material(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox.expand(
                child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Fetch Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 30,
                          ))
                    ],
                  ),
                  Text(
                    "Here are the details of following employee.",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Name: ${user.firstName} ${user.lastName}\nLocation: ${user.address}\nContact Number: ${user.phoneNumber}\n\nProfile Image:',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.network(
                        user.profileImg,
                        height: 160,
                        width: 160,
                      ),
                    ],
                  )
                ],
              ),
            )),
          ),
        ),
      );
    },
  );
}
