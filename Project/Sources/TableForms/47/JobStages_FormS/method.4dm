If (False:C215)
	//Table Form Method Name: [JOB_STAGES]JobStages_FormS
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>DataSize; r1)
	C_REAL:C285($VAT; vAmount; vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; vComments)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOB_STAGES].JobStages_FormS"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		If ((r1=1) | ([JOBS:26]Print_Comments:48=False:C215))
			vComments:=""
		Else 
			SetFontsByPointerParameter(<>DataSize; ""; 0; ->vComments)
			//Set_Fonts ("vComments";◊DataSize)
			r1:=1
		End if 
		Set_Fonts("vT"; <>DataSize-1)
		Set_Fonts("[JOB STAGES]Stage Name+vAmount"; <>DataSize)
		vAmount:=[JOB_STAGES:47]AS_Quoted_Amount:7
		RELATE ONE:C42([JOB_STAGES:47]TAX_Code:14)
		$VAT:=Round:C94((vAmount*([TAX_CODES:35]Tax_Rate:3/100)); 2)
		vSubtotal:=Round:C94((vSubtotal+vAmount); 2)
		vVAT:=Round:C94((vVAT+$VAT); 2)
		vTotal:=Round:C94((vTotal+vAmount+$VAT); 2)
		Form_vT([JOB_STAGES:47]Print_Description:49; [JOB_STAGES:47]Description:48)
End case 
ERR_MethodTrackerReturn("FM [JOB_STAGES].JobStages_FormS"; $_t_oldMethodName)
