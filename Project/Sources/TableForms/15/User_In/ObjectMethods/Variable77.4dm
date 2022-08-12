If (False:C215)
	//object Name: [USER]User_In.Variable77
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAT_al_ImageSources;0)
	//ARRAY TEXT(CAT_at_ImageSources;0)
	C_LONGINT:C283($_l_event; B_ModPath; CAT_l_PictureSource)
	C_TEXT:C284($_t_oldMethodName; CAT_t_CatImageSource; CAT_t_PictureNaming; CAT_T_PicturePath)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable77"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (CAT_at_ImageSources>0)
			CAT_t_CatImageSource:=CAT_at_ImageSources{CAT_at_ImageSources}
			CAT_l_PictureSource:=CAT_al_ImageSources{CAT_at_ImageSources}
			If (CAT_al_ImageSources{CAT_at_ImageSources}=1)  //images on disk
				OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; True:C214)
				OBJECT SET VISIBLE:C603(CAT_T_PicturePath; True:C214)
				OBJECT SET VISIBLE:C603(B_ModPath; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oCat_T_PicPPop"; True:C214)
				OBJECT SET VISIBLE:C603(CAT_t_PictureNaming; True:C214)
				
				
			Else 
				OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; False:C215)
				OBJECT SET VISIBLE:C603(CAT_T_PicturePath; False:C215)
				OBJECT SET VISIBLE:C603(B_ModPath; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCat_T_PicPat"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oCat_T_PicPPop"; False:C215)
				OBJECT SET VISIBLE:C603(CAT_t_PictureNaming; False:C215)
				
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable77"; $_t_oldMethodName)
