If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Pop-up%2FDrop-down List3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(EW_ai_ExportOrder;0)
	C_REAL:C285(iLoc)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Pop-up/Drop-down List3"; Form event code:C388)
Case of 
	: ((Self:C308->{Self:C308->}="daybook ecommerce") & (Size of array:C274(EW_ai_ExportOrder)>0))
		//   ALERT("You must delete all the existing Exports first if you want to "+"switc
		Gen_Alert("You must delete all the existing Exports first if you want to "+"switch to the ecommerce export format.")
		Self:C308->:=Find in array:C230(Self:C308->; [EW_ExportProjects:117]Exportformat:7)
	: (Self:C308-><1)
		iLoc:=Find in array:C230(Self:C308->; [EW_ExportProjects:117]Exportformat:7)
		If (iLoc>0)
			Self:C308->:=iLoc
		Else 
			Self:C308->:=1
			[EW_ExportProjects:117]Exportformat:7:=Self:C308->{1}
		End if 
	Else 
		[EW_ExportProjects:117]Exportformat:7:=Self:C308->{Self:C308->}
End case 
EW_HideShowObjects
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Pop-up/Drop-down List3"; $_t_oldMethodName)
