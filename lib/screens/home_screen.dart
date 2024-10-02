import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:girman/screens/girman_web_view.dart';
import 'package:girman/widgets/user_list_item.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../blocs/search_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    // No initial fetch on start
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset("assets/images/full_logo.png"),
          ],
        ),
        actions: [
          PopupMenuButton(
            offset: Offset(0, 45),
            color: Colors.white,
            icon: Icon(Icons.menu, color: Colors.black),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12, bottom: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "SEARCH",
                          style: TextStyle(
                            color: Color(0xFF3063E6),
                            fontSize: 15,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const GirmanWebView(
                                      title: "Girman Website",
                                      link: "https://www.girmantech.com")),
                            );
                          },
                          child:
                              Text("WEBSITE", style: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GirmanWebView(
                                    title: "Girman LinkedIn",
                                    link:
                                        "https://www.linkedin.com/company/girmantech"),
                              ),
                            );
                          },
                          child:
                              Text("LINKEDIN", style: TextStyle(fontSize: 15)),
                        ),
                        SizedBox(height: 24),
                        GestureDetector(
                          onTap: () async {
                            await launchUrlString(
                                "mailto:contact@girmantech.com");
                          },
                          child:
                              Text("CONTACT", style: TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFB1CBFF)],
            stops: [0.3, 1],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(34, _isSearching ? 20 : 100, 34, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!_isSearching) ...[
                Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth),
                SizedBox(height: 20),
              ],
              PhysicalModel(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                elevation: 3.0,
                shadowColor: Color(0xffD7D7EA),
                child: TextField(
                  controller: _searchController,
                  onSubmitted: (query) {
                    if (query.isEmpty) {
                      setState(() {
                        _isSearching = false;
                      });
                      return;
                    }
                    context.read<SearchBloc>().add(SearchUsers(query));
                    setState(() {
                      _isSearching = true;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                          color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Color(0xFF71717A)),
                    hintText: "Search",
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              _isSearching
                  ? Expanded(
                      child: BlocBuilder<SearchBloc, SearchState>(
                        builder: (context, state) {
                          if (state is SearchLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is SearchSuccess) {
                            return ListView.builder(
                              itemCount: state.users.length,
                              itemBuilder: (context, index) {
                                final user = state.users[index];
                                return UserListItem(user: user);
                              },
                            );
                          } else if (state is SearchNoData) {
                            return Image.asset('assets/images/no_data.png');
                          }
                          return Container();
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
