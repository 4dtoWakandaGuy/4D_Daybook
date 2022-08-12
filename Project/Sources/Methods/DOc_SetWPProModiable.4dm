//%attributes = {}

If (False:C215)
	//Project Method Name:      DOc_SetWPProModiable
	//------------------ Method Notes ------------------
	//this is to replace DC_setWriteModifiable
	
	//------------------ Revision Control ----------------
	//Date Created:  20/07/2021
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN($2)
	C_BOOLEAN:C305($_bo_Editable; $_bo_MakeEditable; $3; $_bo_Editable; $_bo_MakeEditable; $3)
	C_OBJECT:C1216($_obj_WriteDocument; $1; $_obj_WriteDocument; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_SetWriteModifiable")
If (Count parameters:C259>=3)
	$_obj_WriteDocument:=$1
	$_bo_Editable:=$3
	
	//if $3 =TRUE the document will have text access and the menus showing etc
	Case of 
		: ($_bo_Editable)
			If (DB_UserHas4DWriteAccess)
				$_bo_MakeEditable:=True:C214
				//WR TEXT ACCESS($1; 0)  // free access to area
				WP SET ATTRIBUTES:C1342($_obj_WriteDocument; wk protection enabled:K81:307; wk false:K81:173)
				
				If ($2>0)
					//2022 WR SET AREA PROPERTY($1; 0; 0)  //confirm dialog-0 =no dialogue
					//2022 WR SET AREA PROPERTY($1; 1; 0)  // picture previeuw 0= no preview
					//2022 WR SET AREA PROPERTY($1; 4; 0)  //fixed print size = no fixed
					//2022 WR SET AREA PROPERTY($1; wr allow undo; 1)  //
					//2022 WR SET DOC PROPERTY($1; wr view standard palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view format palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view style palette; 1)
					//2022 WR SET DOC PROPERTY($1; wr view borders palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view menubar; 1)
					//2022 WR SET DOC PROPERTY($1; wr view statusbar; 1)
					//2022 WR SET DOC PROPERTY($1; wr view rulers; 1)
					
				Else 
					//enable hiding the palletes whilst retaining editable..added NG March 2007
					//2022 WR SET AREA PROPERTY($1; 0; 0)
					//2022 WR SET AREA PROPERTY($1; 1; 0)
					//2022 WR SET AREA PROPERTY($1; 4; 0)
					//2022 WR SET AREA PROPERTY($1; wr allow undo; 1)
					//2022 WR SET DOC PROPERTY($1; wr view standard palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view format palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view style palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view borders palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view menubar; 1)
					//2022 WR SET DOC PROPERTY($1; wr view statusbar; 0)
					//2022 WR SET DOC PROPERTY($1; wr view rulers; 0)
					
				End if 
				
				If ($2=1)
					//2022 WP SET VIEW PROPERTIES($_obj_WriteDocument; wk visible references; True)
					
					//WR SET DOC PROPERTY($1; wr view references; 1)
				Else 
					//2022 WP SET VIEW PROPERTIES($_obj_WriteDocument; wk visible references; False)
					
					//WR SET DOC PROPERTY($1; wr view references; 0)
				End if 
			End if 
		Else 
			If (DB_UserHas4DWriteAccess)
				//WR TEXT ACCESS($1; 1)
				WP SET ATTRIBUTES:C1342($_obj_WriteDocument; wk protection enabled:K81:307; wk false:K81:173)
				
				If ($2>=0)
					//2022 WR SET AREA PROPERTY($1; 0; 0)
					//2022 WR SET AREA PROPERTY($1; 1; 0)
					//2022 WR SET AREA PROPERTY($1; 4; 0)
					//2022 WR SET AREA PROPERTY($1; wr allow undo; 1)
					//2022 WR SET DOC PROPERTY($1; wr view standard palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view format palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view style palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view borders palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view menubar; 1)
					//2022 WR SET DOC PROPERTY($1; wr view statusbar; 0)
					//2022 WR SET DOC PROPERTY($1; wr view rulers; 0)
				Else 
					//enable hiding the palletes whilst retaining editable..added NG March 2007
					//2022 WR SET AREA PROPERTY($1; 0; 0)
					//2022 WR SET AREA PROPERTY($1; 1; 0)
					//2022 WR SET AREA PROPERTY($1; 4; 0)
					//2022 WR SET AREA PROPERTY($1; wr allow undo; 1)
					//2022 WR SET DOC PROPERTY($1; wr view standard palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view format palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view style palette; 1)
					//2022 WR SET DOC PROPERTY($1; wr view borders palette; 0)
					//2022 WR SET DOC PROPERTY($1; wr view menubar; 1)
					//2022 WR SET DOC PROPERTY($1; wr view statusbar; 1)
					//2022 WR SET DOC PROPERTY($1; wr view rulers; 1)
					
				End if 
				If ($2=1)
					//2022 WP SET VIEW PROPERTIES($_obj_WriteDocument; wk visible references; True)
					
					//WR SET DOC PROPERTY($1; wr view references; 1)
				Else 
					//WR SET DOC PROPERTY($1; wr view references; 0)
					//2022 WP SET VIEW PROPERTIES($_obj_WriteDocument; wk visible references; False)
					//2022 
				End if 
			End if 
	End case 
	ERR_MethodTrackerReturn("DOC_SetWriteModifiable"; $_t_oldMethodName)
End if 
