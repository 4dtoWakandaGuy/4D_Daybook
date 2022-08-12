//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_PPFormL2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 10:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_LONGINT:C283(r1)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; vComments; vDetails; vLayCode; vNumber; vTitle; vTitle1; vTitle11; vTitle12; vTitle15; vTitle2)
	C_TEXT:C284(vTitle3; vTitle4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPFormL2")
If (vLayCode#[JOBS:26]Job_Code:1)
	QUERY:C277([JOB_STAGES:47]; [JOB_STAGES:47]Job_Code:1=[JOBS:26]Job_Code:1)
	ORDER BY:C49([JOB_STAGES:47]; [JOB_STAGES:47]Stage_Code:2; >)
	RELATE ONE:C42([JOBS:26]Company_Code:3)
	RELATE ONE:C42([JOBS:26]Contact_Code:4)
	Letter_Details
	Forms_Tit567Cur([JOBS:26]Currency_Code:25)
	vTitle:=Uppercase:C13(Term_OrdWT("Quotation"))
	vTitle1:="Attn"
	vTitle11:="Terms"
	vTitle3:="Our Ref"
	vTitle2:="Your Ref"
	vTitle4:="Date"
	vTitle12:="Description"
	vTitle15:="Amount "+[JOBS:26]Currency_Code:25
	vSubtotal:=0
	vVAT:=0
	vTotal:=0
	vDate:=[JOBS:26]Start_Date:6
	vNumber:=[JOBS:26]Job_Code:1
	Address_Lines(vDetails)
	vLayCode:=[JOBS:26]Job_Code:1
	If ([JOBS:26]Print_Comments:48=False:C215)
		vComments:=""
	Else 
		vComments:=[JOBS:26]Comments:15+Char:C90(13)
	End if 
	r1:=0
End if 
ERR_MethodTrackerReturn("Jobs_PPFormL2"; $_t_oldMethodName)