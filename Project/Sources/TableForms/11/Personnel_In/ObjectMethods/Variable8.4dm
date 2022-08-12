If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PER_al_PageNos;0)
	//ARRAY TEXT(PER_at_Pages;0)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; WIN_CurrentOutputformSet; WIN_t_CurrentInputForm)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.Variable8"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		FORM GOTO PAGE:C247(PER_al_PageNos{PER_at_Pages})
		
		Case of 
			: (PER_al_PageNos{PER_at_Pages}=5)
				//SET COLOR(Per_Pi_Header;-(190+(256*190)))
				INT_SetInput(Table:C252(->[JOBS:26]); "Job_In")
				WIN_CurrentOutputformSet:=""  //set to blank for force reload in Output afterwards
				
			Else 
				//SET COLOR(Per_Pi_Header;-(223+(256*223)))
				INT_SetInput(Table:C252(->[PERSONNEL:11]); WIN_t_CurrentInputForm)
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.Variable8"; $_t_oldMethodName)
