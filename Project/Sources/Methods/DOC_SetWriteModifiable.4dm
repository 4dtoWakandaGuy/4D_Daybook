//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_SetWriteModifiable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	C_BOOLEAN:C305($_bo_Modifiable; $_bo_ShowPal; $_bo_ShowPalettes; $3; $_bo_Modifiable; $_bo_ShowPalettes; $3)
	C_LONGINT:C283($1; $2)
	C_OBJECT:C1216($_obj_WidgetSkin; $_obj_WParea; $_obj_WpWidget; $4; $5; $_obj_WidgetSkin; $_obj_WParea; $_obj_WpWidget; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_SetWriteModifiable")
//if 1 is passed in $2 the references will not be shown
//if $3 =TRUE the document will have text access and the menus showing etc
C_OBJECT:C1216($_obj_WidgetSkin)

OB SET:C1220($_obj_WidgetSkin; "skinName"; "light")  // can be "black","dark", "grey", "light", "white", "night".
OB SET:C1220($_obj_WidgetSkin; "backgroundColor"; 0x00A0A0A0)  //sets background color for control panel
OB SET:C1220($_obj_WidgetSkin; "separatorColor"; 0x00D04060)  //sets background color of separator areas
OB SET:C1220($_obj_WidgetSkin; "fontColor"; 0x002080C0)  //sets font color for control panel text
OB SET:C1220($_obj_WidgetSkin; "separatorFontColor"; 0x00803000)  //sets font color for separator area text

OB SET:C1220($_obj_WidgetSkin; "font"; "Times")  // sets font used
OB SET:C1220($_obj_WidgetSkin; "fontSize"; 13)  // sets size of font used

OB SET:C1220($_obj_WidgetSkin; "scrollbar"; True:C214)
//once i test this i can then do some things around the way the skin is set

// Then you just need to assign this custom skin to the 4D Write Pro object
// OB SET($WP_object;"skin";$WP_skin)
If (Count parameters:C259>=4)
	$_bo_Modifiable:=$3
	
	$_obj_WParea:=$4
	$_obj_WpWidget:=$5
	//2022 temp OB SET($_obj_WpWidget; $_obj_WidgetSkin)  //
	Case of 
		: ($_bo_Modifiable)
			If (DB_UserHas4DWriteAccess)
				OBJECT SET ENABLED:C1123($_obj_WParea; True:C214)
				$_bo_ShowPalettes:=($2>0)
				OBJECT SET VISIBLE:C603($_obj_WpWidget; $_bo_ShowPalettes)
				
			Else 
				OBJECT SET ENABLED:C1123($_obj_WParea; False:C215)
				$_bo_ShowPalettes:=False:C215
				OBJECT SET VISIBLE:C603($_obj_WpWidget; $_bo_ShowPalettes)
				
			End if 
			
		Else 
			If (DB_UserHas4DWriteAccess)
				OBJECT SET ENABLED:C1123($_obj_WParea; True:C214)
				$_bo_ShowPalettes:=($2>0)
				OBJECT SET VISIBLE:C603($_obj_WpWidget; $_bo_ShowPalettes)
				
			Else 
				OBJECT SET ENABLED:C1123($_obj_WParea; False:C215)
				$_bo_ShowPalettes:=False:C215
				OBJECT SET VISIBLE:C603($_obj_WpWidget; $_bo_ShowPalettes)
				
			End if 
	End case 
Else 
	Case of 
		: ($3)
			If (DB_UserHas4DWriteAccess)
				WR TEXT ACCESS:P12000:42($1; 0)
				If ($2>0)
					WR SET AREA PROPERTY:P12000:137($1; 0; 0)
					WR SET AREA PROPERTY:P12000:137($1; 1; 0)
					WR SET AREA PROPERTY:P12000:137($1; 4; 0)
					WR SET AREA PROPERTY:P12000:137($1; wr allow undo:K12004:3; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view standard palette:K12003:12; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view format palette:K12003:13; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view style palette:K12003:14; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view borders palette:K12003:15; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view menubar:K12003:11; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view statusbar:K12003:10; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view rulers:K12003:3; 1)
					
				Else 
					//enable hiding the palletes whilst retaining editable..added NG March 2007
					WR SET AREA PROPERTY:P12000:137($1; 0; 0)
					WR SET AREA PROPERTY:P12000:137($1; 1; 0)
					WR SET AREA PROPERTY:P12000:137($1; 4; 0)
					WR SET AREA PROPERTY:P12000:137($1; wr allow undo:K12004:3; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view standard palette:K12003:12; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view format palette:K12003:13; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view style palette:K12003:14; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view borders palette:K12003:15; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view menubar:K12003:11; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view statusbar:K12003:10; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view rulers:K12003:3; 0)
					
				End if 
				
				If ($2=1)
					WR SET DOC PROPERTY:P12000:109($1; wr view references:K12003:17; 1)
				Else 
					WR SET DOC PROPERTY:P12000:109($1; wr view references:K12003:17; 0)
				End if 
			End if 
		Else 
			If (DB_UserHas4DWriteAccess)
				WR TEXT ACCESS:P12000:42($1; 1)
				If ($2>=0)
					WR SET AREA PROPERTY:P12000:137($1; 0; 0)
					WR SET AREA PROPERTY:P12000:137($1; 1; 0)
					WR SET AREA PROPERTY:P12000:137($1; 4; 0)
					WR SET AREA PROPERTY:P12000:137($1; wr allow undo:K12004:3; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view standard palette:K12003:12; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view format palette:K12003:13; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view style palette:K12003:14; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view borders palette:K12003:15; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view menubar:K12003:11; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view statusbar:K12003:10; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view rulers:K12003:3; 0)
				Else 
					//enable hiding the palletes whilst retaining editable..added NG March 2007
					WR SET AREA PROPERTY:P12000:137($1; 0; 0)
					WR SET AREA PROPERTY:P12000:137($1; 1; 0)
					WR SET AREA PROPERTY:P12000:137($1; 4; 0)
					WR SET AREA PROPERTY:P12000:137($1; wr allow undo:K12004:3; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view standard palette:K12003:12; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view format palette:K12003:13; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view style palette:K12003:14; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view borders palette:K12003:15; 0)
					WR SET DOC PROPERTY:P12000:109($1; wr view menubar:K12003:11; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view statusbar:K12003:10; 1)
					WR SET DOC PROPERTY:P12000:109($1; wr view rulers:K12003:3; 1)
					
				End if 
				If ($2=1)
					WR SET DOC PROPERTY:P12000:109($1; wr view references:K12003:17; 1)
				Else 
					WR SET DOC PROPERTY:P12000:109($1; wr view references:K12003:17; 0)
				End if 
			End if 
	End case 
End if 
ERR_MethodTrackerReturn("DOC_SetWriteModifiable"; $_t_oldMethodName)
