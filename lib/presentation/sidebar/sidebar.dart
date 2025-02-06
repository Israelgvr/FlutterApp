import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _rotateAnimation;
  final Duration _animationDuration = const Duration(milliseconds: 600);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );

    _slideAnimation = Tween<double>(begin: -300, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutQuint,
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.3, 1.0, curve: Curves.easeOutBack),
      ),
    );

    _rotateAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSidebar() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Fondo semitransparente
        if (_animationController.status == AnimationStatus.forward ||
            _animationController.status == AnimationStatus.completed)
          GestureDetector(
            onTap: _toggleSidebar,
            child: Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.black.withOpacity(0.3),
            ),
          ),

        // Sidebar con animaciones
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_slideAnimation.value, 0),
              child: Transform.scale(
                scale: _scaleAnimation.value,
                alignment: Alignment.centerLeft,
                child: child,
              ),
            );
          },
          child: Container(
            width: 300,
            height: screenSize.height,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: _buildSidebarContent(),
            ),
          ),
        ),

        // Botón de menú flotante
        AnimatedPositioned(
          duration: _animationDuration,
          left: _animationController.value * 240 + 20,
          top: 60,
          child: GestureDetector(
            onTap: _toggleSidebar,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.9),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotateAnimation.value,
                    child: Icon(
                      _animationController.isCompleted
                          ? Icons.close
                          : Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSidebarContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 120),
        _buildUserProfile(),
        SizedBox(height: 40),
        _buildMenuItems(),
        Spacer(),
        _buildFooter(),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _buildUserProfile() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(Icons.person, color: Colors.white, size: 30),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                "Premium Member",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItems() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _MenuItem(
            icon: Icons.home_filled,
            title: "Home",
            onTap: () => _navigate(NavigationEvents.HomePageClickedEvent),
          ),
          _MenuItem(
            icon: Icons.person_outline,
            title: "Profile",
            onTap: () => _navigate(NavigationEvents.MyAccountClickedEvent),
          ),
          _MenuItem(
            icon: Icons.history,
            title: "History",
            onTap: () => _navigate(NavigationEvents.MyOrdersClickedEvent),
          ),
          _MenuItem(
            icon: Icons.insights,
            title: "Activity",
            onTap: () => _navigate(NavigationEvents.MyOrdersClickedEvent),
          ),
          _MenuItem(
            icon: Icons.notifications_none,
            title: "Notifications",
            onTap: () => _navigate(NavigationEvents.MyOrdersClickedEvent),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 20),
          _MenuItem(
            icon: Icons.settings_outlined,
            title: "Settings",
            onTap: () => _navigate(NavigationEvents.MyOrdersClickedEvent),
          ),
          _MenuItem(
            icon: Icons.logout,
            title: "Logout",
            color: Colors.redAccent,
            onTap: () => _navigate(NavigationEvents.MyOrdersClickedEvent),
          ),
        ],
      ),
    );
  }

  void _navigate(NavigationEvents event) {
    _toggleSidebar();
    BlocProvider.of<NavigationBloc>(context).add(event);
  }
}

class _MenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  final Color? color;

  const _MenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
    this.color,
  });

  @override
  __MenuItemState createState() => __MenuItemState();
}

class __MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => widget.onTap(),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: _isHovered
                ? Colors.blueAccent.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.color ?? Colors.blueAccent,
                size: 24,
              ),
              SizedBox(width: 20),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: widget.color ?? Colors.grey.shade800,
                ),
              ),
              Spacer(),
              if (_isHovered)
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.blueAccent,
                ),
            ],
          ),
        ),
      ),
    );
  }
}