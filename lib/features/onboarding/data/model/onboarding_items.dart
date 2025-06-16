import 'package:equatable/equatable.dart';

class OnBoardingItems extends Equatable  {
  final String title;
  final String description;
  
   const OnBoardingItems({required this.title, required this.description});

  @override
  List<Object?> get props => [title, description];

  
  static List<OnBoardingItems> getItems() {
    return [
      OnBoardingItems(
          title: "all-in-one delivery",
          description: "Order groceries, medicines, and meals delivered straight to your door"
      ),
      OnBoardingItems(
          title: "User-to-User Delivery",
          description: "Send or receive items from other users quickly and easily"
      ),
      OnBoardingItems(
          title: "Sales & Discounts",
          description: "Discover exclusive sales and deals every day"
      )
    ];
  }
}


