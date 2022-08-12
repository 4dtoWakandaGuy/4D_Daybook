If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Variable4
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
	//ARRAY DATE(<>SP_ad_TargetProjectionDate;0)
	//ARRAY DATE(SP_ad_TargetProjectionDate;0)
	//ARRAY LONGINT(<>SP_al_TargetProjectionID;0)
	//ARRAY REAL(<>SP_ar_TargetProjectionAmount;0)
	//ARRAY REAL(SP_ar_TargetProjectionAmount;0)
	C_DATE:C307(SP_D_TargetProjectionDate)
	C_LONGINT:C283($_l_DateRow; $_l_ProbabilityRow; BaddPAT; SP_l_Mode)
	C_REAL:C285(SP_R_TargetProjectionAmount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Variable4"; Form event code:C388)
//in this context we really dont need to be super complicated
//you cannot modify a project so no need to move objects around
//all we are doing is inserting an element and SHOWING the variable
Case of 
	: (SP_l_Mode=0)
		$_l_DateRow:=Find in array:C230(<>SP_ad_TargetProjectionDate; Current date:C33(*))
		If ($_l_ProbabilityRow<0)
			INSERT IN ARRAY:C227(<>SP_ad_TargetProjectionDate; 1; 1)
			INSERT IN ARRAY:C227(<>SP_ar_TargetProjectionAmount; 1; 1)
			INSERT IN ARRAY:C227(<>SP_al_TargetProjectionID; 1; 1)
			OBJECT SET VISIBLE:C603(SP_D_TargetProjectionDate; True:C214)
			OBJECT SET VISIBLE:C603(SP_R_TargetProjectionAmount; True:C214)
			OBJECT SET ENTERABLE:C238(SP_R_TargetProjectionAmount; True:C214)
			//Set eneterable(SP_D_TargetProjectionDate;True)
			SP_D_TargetProjectionDate:=Current date:C33(*)
			SP_R_TargetProjectionAmount:=0
			OBJECT SET TITLE:C194(BaddPAT; "Save Projection")
			SP_l_Mode:=1
			GOTO OBJECT:C206(SP_ar_TargetProjectionAmount)
		Else 
			OBJECT SET VISIBLE:C603(SP_D_TargetProjectionDate; True:C214)
			OBJECT SET VISIBLE:C603(SP_R_TargetProjectionAmount; True:C214)
			OBJECT SET ENTERABLE:C238(SP_R_TargetProjectionAmount; True:C214)
			//Set eneterable(SP_D_TargetProjectionDate;True)
			SP_D_TargetProjectionDate:=<>SP_ad_TargetProjectionDate{$_l_ProbabilityRow}
			SP_R_TargetProjectionAmount:=<>SP_ar_TargetProjectionAmount{$_l_ProbabilityRow}
			OBJECT SET TITLE:C194(BaddPAT; "Save Projection")
			SP_l_Mode:=2
			GOTO OBJECT:C206(SP_ar_TargetProjectionAmount)
			
		End if 
		
	: (SP_l_Mode=1)
		If (SP_R_TargetProjectionAmount>0)
			
			//'save' the entry to the array(the array is saved to data after)
			<>SP_ad_TargetProjectionDate{1}:=SP_D_TargetProjectionDate
			<>SP_ar_TargetProjectionAmount{1}:=SP_R_TargetProjectionAmount
			<>SP_al_TargetProjectionID{1}:=-(Size of array:C274(SP_al_TargetProjectionID)+1)
			OBJECT SET VISIBLE:C603(SP_D_TargetProjectionDate; False:C215)
			OBJECT SET VISIBLE:C603(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_D_TargetProjectionDate; False:C215)
		Else 
			DELETE FROM ARRAY:C228(<>SP_ad_TargetProjectionDate; 1; 1)
			DELETE FROM ARRAY:C228(<>SP_ar_TargetProjectionAmount; 1; 1)
			DELETE FROM ARRAY:C228(<>SP_al_TargetProjectionID; 1; 1)
			
			OBJECT SET VISIBLE:C603(SP_D_TargetProjectionDate; False:C215)
			OBJECT SET VISIBLE:C603(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_D_TargetProjectionDate; False:C215)
			
		End if 
		SP_l_Mode:=0
		OBJECT SET TITLE:C194(BaddPAT; "Modify Projection")
		GOTO OBJECT:C206([SALES_PROJECTION:113]Title:21)
	: (SP_l_Mode=2)
		If (SP_R_TargetProjectionAmount>0)
			//'save' the entry to the array(the array is saved to data after)
			$_l_ProbabilityRow:=Find in array:C230(SP_ad_TargetProjectionDate; Current date:C33(*))
			<>SP_ad_TargetProjectionDate{$_l_ProbabilityRow}:=SP_D_TargetProjectionDate
			<>SP_ar_TargetProjectionAmount{$_l_ProbabilityRow}:=SP_R_TargetProjectionAmount
			OBJECT SET VISIBLE:C603(SP_D_TargetProjectionDate; False:C215)
			OBJECT SET VISIBLE:C603(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_D_TargetProjectionDate; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(SP_D_TargetProjectionDate; False:C215)
			OBJECT SET VISIBLE:C603(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_R_TargetProjectionAmount; False:C215)
			OBJECT SET ENTERABLE:C238(SP_D_TargetProjectionDate; False:C215)
			
		End if 
		SP_l_Mode:=0
		OBJECT SET TITLE:C194(BaddPAT; "Modify Projection")
		GOTO OBJECT:C206([SALES_PROJECTION:113]Title:21)
End case 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Variable4"; $_t_oldMethodName)
