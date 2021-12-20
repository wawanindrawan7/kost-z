import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kost_z/common/request_state.dart';
import 'package:kost_z/common/styles.dart';
import 'package:kost_z/models/user_model.dart';
import 'package:kost_z/pages/search_page.dart';
import 'package:kost_z/providers/kost_notifier.dart';
import 'package:kost_z/widgets/features_card.dart';
import 'package:kost_z/widgets/kost_item_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  late TextEditingController _searchQuery;
  String valueQuery = 'new value query';
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("user")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
    _searchQuery = TextEditingController();
  }

  void onUpdateSearchQuery(String newQuery) {
    setState(() {
      valueQuery = newQuery;
    });
  }

  Widget _buildTitleApp(BuildContext context) {
    return Text(
      "KOST-Z",
      style: titleTextStyle.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: kPrimaryColor,
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      cursorColor: kPrimaryColor,
      controller: _searchQuery,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search ...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey.shade400),
      ),
      style: TextStyle(color: kPrimaryColor, fontSize: 16),
      onChanged: onUpdateSearchQuery,
    );
  }

  Widget buildTitleheader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: Text(
            'Let\'s Explore the\nKost Together',
            textAlign: TextAlign.center,
            style: titleTextStyle.copyWith(
              fontSize: 30,
              color: kWhiteColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildNameHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                Icons.person_rounded,
                color: kWhiteColor,
                size: 22,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Hi, ${loggedInUser.firstName}!',
                style: titleTextStyle.copyWith(
                  fontSize: 14,
                  color: kWhiteColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'images/bg_header.png',
            ),
          ),
        ),
        child: buildNameHeader());
  }

  Widget buildFeatures() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 24),
            child: Text(
              'Features',
              style: titleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          FeaturesCard(),
        ],
      ),
    );
  }

  Widget buildRecommended() {
    return Consumer<KostNotifier>(
      builder: (context, state, _) {
        if (state.state == RequestState.Loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == RequestState.HasData) {
          return Container(
            margin: EdgeInsets.only(top: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24),
                  child: Text(
                    'Recommended',
                    style: titleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: state.result.kosan.length,
                    itemBuilder: (context, index) {
                      var kostan = state.result.kosan[index];
                      return KostItemCard(kost: kostan);
                    },
                  ), //widget Grid
                )
              ],
            ),
          );
        } else if (state.state == RequestState.Empty) {
          return Center(
            child: Text(state.message),
          );
        } else if (state.state == RequestState.Error) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Center(
            child: Text(''),
          );
        }
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildHeader(context),
                  buildFeatures(),
                  buildRecommended(),
                ],
              ),
              buildTitleheader(context),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhiteColor,
        leading: _isSearching
            ? BackButton(
                color: kPrimaryColor,
              )
            : null,
        title: _isSearching ? _buildSearchField() : _buildTitleApp(context),
      ),
      body: buildBody(context),
    );
  }
}
