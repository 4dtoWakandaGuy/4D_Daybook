//%attributes = {}
If (False:C215)
	//Project Method Name:      Ord_SetCardBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 14:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(ORD_at_AuthStatus;0)
	C_LONGINT:C283($_l_Bottom2; $_l_Bottom3; $_l_DifferenceNeeded; $_l_EnclosureHeight; $_l_EnclosuresBottom; $_l_EnclosuresLeft; $_l_EnclosuresRight; $_l_EnclosuresTop; $_l_HeightNeeded; $_l_Left2; $_l_Left3)
	C_LONGINT:C283($_l_NewEncBottom; $_l_objectBottom; $_l_objectLeft; $_l_objectRight; $_l_objectTop; $_l_Right2; $_l_Right3; $_l_SpaceDIfference; $_l_SpaceDIfference2; $_l_SplitterHeight; $_l_SplitterWidth)
	C_LONGINT:C283($_l_Top1; $_l_Top2; $_l_Top3; $_l_Top4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ord_SetCardBox")
If (False:C215)  //not called
	//TRACE
	OBJECT GET COORDINATES:C663(*; "oCardObjectbox"; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
	OBJECT GET COORDINATES:C663(*; "oComment2Splitter"; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Bottom2)
	OBJECT MOVE:C664(*; "oComment2Splitter"; $_l_Left2; $_l_objectTop-10; $_l_objectRight; $_l_objectTop-(10-($_l_Bottom2-$_l_Top2)); *)
	OBJECT GET COORDINATES:C663(*; "oEnclosureLabel"; $_l_objectLeft; $_l_Top2; $_l_Right2; $_l_Bottom2)
	OBJECT GET COORDINATES:C663(*; "oEnclosureSplitter"; $_l_Left3; $_l_Top3; $_l_Right3; $_l_Bottom3)
	$_l_SplitterWidth:=$_l_Right3-$_l_Left3
	If (Size of array:C274(ORD_at_AuthStatus)>4) | (True:C214)
		$_l_HeightNeeded:=(Size of array:C274(ORD_at_AuthStatus)*16)+16
		Case of 
			: ($_l_HeightNeeded<=16)
				$_l_HeightNeeded:=32  //one object
			: ($_l_HeightNeeded>((10*16)+16))
				$_l_HeightNeeded:=(16*10)+16
		End case 
		//$_l_HeightNeeded:=(16*10)+16
		$_l_EnclosureHeight:=($_l_objectTop-20)-$_l_Top2
		
		OBJECT GET COORDINATES:C663(*; "oCardObjectbox"; $_l_objectLeft; $_l_objectTop; $_l_objectRight; $_l_objectBottom)
		OBJECT GET COORDINATES:C663(*; "oListBoxAuths"; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Bottom2)
		//Calculate what aprroximate position the bottom of the enclosures(and comments) boxes will be at
		$_l_NewEncBottom:=(($_l_Bottom2-$_l_HeightNeeded)-($_l_Top2-$_l_objectTop))-10
		OBJECT GET COORDINATES:C663(*; "oEnclosures"; $_l_EnclosuresLeft; $_l_EnclosuresTop; $_l_EnclosuresRight; $_l_EnclosuresBottom)
		//if the height is less than 20 then adjust the size needed for the list box
		If (($_l_NewEncBottom-$_l_EnclosuresTop)<20)
			$_l_DifferenceNeeded:=($_l_EnclosuresTop+20)-($_l_NewEncBottom-$_l_EnclosuresTop)
			// so if it was gonna end up -5 this will now be 25
			//if it was gonna end up 10 this will now be 10
			$_l_HeightNeeded:=$_l_HeightNeeded-$_l_DifferenceNeeded
		End if 
		$_l_SpaceDIfference:=$_l_Top2-$_l_objectTop  //Distance beetween top of CC auth list box and the surrounding box
		$_l_Top1:=$_l_Bottom2-$_l_HeightNeeded
		OBJECT MOVE:C664(*; "oCardObjectbox"; $_l_objectLeft; ($_l_Top1-$_l_SpaceDIfference); $_l_objectRight; $_l_objectBottom; *)
		OBJECT MOVE:C664(*; "oListBoxAuths"; $_l_Left2; $_l_Top1; $_l_Right2; $_l_Bottom2; *)
		OBJECT GET COORDINATES:C663(*; "oComment2Splitter"; $_l_Left2; $_l_Top2; $_l_Right2; $_l_Bottom2)
		$_l_SplitterHeight:=$_l_Bottom2-$_l_Top2
		$_l_SpaceDIfference2:=$_l_objectTop-$_l_Bottom2  //Distance between old group box top and the bottom of the splitter
		$_l_Top3:=($_l_Top1-$_l_SpaceDIfference)-($_l_SpaceDIfference2)
		OBJECT MOVE:C664(*; "oComment2Splitter"; $_l_Left2; $_l_Top3; $_l_Right2; ($_l_Top3+$_l_SplitterHeight); *)
		OBJECT GET COORDINATES:C663(*; "oEnclosureSplitter"; $_l_Left3; $_l_Top4; $_l_Right3; $_l_Bottom3)
		$_l_SplitterWidth:=$_l_Right3-$_l_Left3
		OBJECT MOVE:C664(*; "oEnclosureSplitter"; $_l_Left3; $_l_Top4; $_l_Right3; $_l_Top3; *)
		OBJECT GET COORDINATES:C663(*; "oComments2"; $_l_objectLeft; $_l_Top2; $_l_objectRight; $_l_Bottom2)
		OBJECT MOVE:C664(*; "oComments2"; $_l_objectLeft; $_l_Top2; $_l_objectRight; $_l_Top3-5; *)
		OBJECT GET COORDINATES:C663(*; "oEnclosures"; $_l_objectLeft; $_l_Top2; $_l_objectRight; $_l_Bottom2)
		OBJECT MOVE:C664(*; "oEnclosures"; $_l_objectLeft; $_l_Top2; $_l_objectRight; $_l_Top3-5; *)
		
		
	End if 
End if 
ERR_MethodTrackerReturn("Ord_SetCardBox"; $_t_oldMethodName)
