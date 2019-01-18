# TestTabbar

This document describes the workflow to update the properties of UI components.

## Getting Started

Each tab in our app will show a different screen that is managed by a view controller. A view controller has a view that can contain
other views or UI components and you can add subviews to those subviews, forming a view hierarchy. Having the view hierachy for a view
controller is important for positioning a component because you can only set its constraints relative to its superview or components
that are part of the same superview. Some of the common UI components include UIView, UITableView, UITableViewCell, UICollectionView, 
UICollectionViewCell, UIButton, UILabel, and UIImageview. We will cover how to set some of properties of these components to change
their look as well how to set their constraints which affects their position on-screen. 

### Prerequisites

To set the properties of UI components we will be providing a file for every view controller with the naming convention below so that 
they can be easily found in Xcode.

```
<view controller name>UIConstants.swift
```

For example, if the view controller name is MyProgramVC, then the file will be called `MyProgramVCUIConstants.swift`.

Note that this file also contains the view hierarchy of MyProgramVC to help with setting the contraints of views. At the bottom you have
navigationBarTitleLabel and the view of MyProgramVC. navigationBarTitleLabel does not have any subviews and view has two: weekView and
exerciseTableView.

## Changing the properties of components

On Xcode, build and run the project with `command + R`, so that you can see how the app currently looks like on the simulator. Notice that
the background color of the weekView is red, the corners of exerciseImageView are not rounded, and exerciseImageView does not contain an 
image. We are going to change these properties in the `MyProgramVCUIConstants.swift` file. 

To change the background color from red to black change the value of `WEEK_VIEW_BG_COLOR` from 
`UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)` to `UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)`. The parameters red, 
green, blue, and alpha can be assigned a value between 0.0 and 1.0. The alpha parameter is the opacity of the color with 0.0 being 
completely transparent and 1.0 being opaque.

To change the corner radius of exerciseImageView `EXERCISE_IMAGE_VIEW_CORNER_RADIUS` to the desired value. I normaly use a 10.0. You can
also assign an image to exerciseImageView by setting `EXERCISE_IMAGE_VIEW_IMAGE_NAME`to an image name that is available in the Assets 
folder.


