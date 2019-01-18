# TestTabbar

This document describes the workflow to update the properties of UI components and set their constraints.

## Getting Started

Each view in our app will show a different screen that is managed by a view controller. A view controller has a view that can contain
other views or UI components and you can add subviews to those subviews, forming a view hierarchy. Having the view hierachy for a view
controller is important for positioning a component because you can only set its constraints relative to its superview or components
that are part of the same superview. Some of the common UI components include UIView, UITableView, UITableViewCell, UICollectionView, 
UICollectionViewCell, UIButton, UILabel, and UIImageview. We will cover how to set some of properties of these components to change
how they look as well how to set their constraints which assigns them a position on-screen and dimensions. 

### Prerequisites

To set the properties of UI components we will be providing a file for every view controller with the naming convention below so that 
they can be easily found in Xcode.

```
<view controller name>UIConstants.swift
```

For example, if the view controller name is MyProgramVC, then the file will be called `MyProgramVCUIConstants.swift`.

This file will also contain the view hierarchy of MyProgramVC to help with setting the contraints of views. At the bottom of the hierarchy
you have navigationBarTitleLabel and the view of MyProgramVC. navigationBarTitleLabel does not have any subviews and view has two: weekView and exerciseTableView. The constraints of these subviews are set in `MyProgramVC.swift`. Note that weekView and exerciseTableView
have subviews whose constraints are set in `WeekView.swift` and `ExerciseTableViewCell.swift` respectively.

## Changing the properties of components

On Xcode, build and run the project with `command + R`, so that you can see how the app looks on the simulator. Notice that
the background color of the weekView is red, the corners of exerciseImageView are not rounded, and exerciseImageView does not contain an 
image. We are going to change these properties in the `MyProgramVCUIConstants.swift` file. 

To change the background color from red to black change the value of `WEEK_VIEW_BG_COLOR` from 
`UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)` to `UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)`. The parameters red, 
green, blue, and alpha can be assigned a value between 0.0 and 1.0. The alpha parameter is the opacity of the color with 0.0 being 
completely transparent and 1.0 being opaque. Build and run the project again to see the changes in the simulator.

To change the corner radius of exerciseImageView set `EXERCISE_IMAGE_VIEW_CORNER_RADIUS` to the desired value (I normaly use a 10.0). You
can also assign an image to exerciseImageView by setting `EXERCISE_IMAGE_VIEW_IMAGE_NAME`to an image name that is available in our
project.

Note: When setting the font of label, you can see the fonts supported by swift by looking at the `Fonts in Swift.pdf` file. Just 
copy-paste a font name that you like to the appropriate constant.

## Setting contraints on components

Setting constraints on components programmatically is straightforward in Swift. For example, notice from the view hierarchy that the view
of MyProgramVC contains two subviews: weekView and exerciseTableView. The code below shows how their constraints are set which is located
in `MyProgramVC.swift`.

constraints for weekView:
```
weekView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
weekView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
weekView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
weekView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06).isActive = true
```

Notice that the top, left, and right anchors of the weekView are set to be the same as the corresponding anchors of the safe area of
view. The picture below shows what the safe area of a view is.

![](https://github.com/hrodri02/TestTabbar/blob/master/screenshots/SafeArea.png)

Note that the height of the weekView is to be 6 % of the height of the view. We can also use a constant, but it's better to use a
multiplier to account for different screen sizes.

constraints for exerciseTableView:
```
exerciseTableView.topAnchor.constraint(equalTo: weekView.bottomAnchor).isActive = true
exerciseTableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
exerciseTableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
exerciseTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
```

The only constraint that is interesting in this case is the first one. The top of the exerciseTableView is set to the bottom of the
weekView.

There are other anchors that we can use. To demonstrate, observe the contraints for the 7 weekDayViews inside of weekView.

```
for i in 0 ... 6 {
  weekDayViews[i].widthAnchor.constraint(equalToConstant: 20).isActive = true
  weekDayViews[i].heightAnchor.constraint(equalToConstant: 35).isActive = true
  weekDayViews[i].centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
  
  let m = CGFloat(2*i + 1)/7.0
  NSLayoutConstraint(item: weekDayViews[i], attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, 
    multiplier: m, constant: 0).isActive = true
}
```
For all weekDayViews, we set the width and height to constants and algined them vertically with weekView using the centerYAnchor. To 
have all weekDayViews be evenly spaced horizontally within weekView we need to set centerX anchor of each weekDay view to be a multiple
of the centerX of weekView. That is, the centerX of the first weekDayView will be 1/7 of the horizontal distance of the centerX of 
weekView, the second will be 3/7, and so on as shown below. We are using multiples of 1/7 because there are 7 weekDayViews inside of 
weekView.

```
|   1/7   3/7   5/7   7/7   9/7   11/7   13/7   |
```

