import 'package:flutter/material.dart';
import 'package:gallery/studies/reply/model/email_store.dart';
import 'package:provider/provider.dart';

class const SearchPage({super.key}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Material(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButton(
                      key: const ValueKey('ReplyExit'),
                      onPressed: () {
                        Provider.of<EmailStore>(
                          context,
                          listen: false,
                        ).onSearchPage = false;
                      },
                    ),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration.collapsed(
                          hintText: 'Search email',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(title: 'YESTERDAY'),
                      _SearchHistoryTile(
                        search: '481 Van Brunt Street',
                        address: 'Brooklyn, NY',
                      ),
                      _SearchHistoryTile(
                        icon: Icons.home,
                        search: 'Home',
                        address: '199 Pacific Street, Brooklyn, NY',
                      ),
                      _SectionHeader(title: 'THIS WEEK'),
                      _SearchHistoryTile(
                        search: 'BEP GA',
                        address: 'Forsyth Street, New York, NY',
                      ),
                      _SearchHistoryTile(
                        search: 'Sushi Nakazawa',
                        address: 'Commerce Street, New York, NY',
                      ),
                      _SearchHistoryTile(
                        search: 'IFC Center',
                        address: '6th Avenue, New York, NY',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class const _SectionHeader({required final String title}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 16,
        top: 16,
        bottom: 16,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}

class const _SearchHistoryTile({
    final IconData icon = Icons.access_time,
    required final String search,
    required final String address,
  }) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(search),
      subtitle: Text(address),
      onTap: () {},
    );
  }
}
