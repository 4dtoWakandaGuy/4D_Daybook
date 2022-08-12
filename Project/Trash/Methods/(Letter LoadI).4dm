//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter_LoadI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocumentCode; vLetterCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_LoadI")
//Letter_LoadI
If (([CREDIT_STAGES:54]Document_Code:5#"") & ((vLetterCode="AUTO") | (Character code:C91(vLetterCode)=64) | (vLetterCode="")))
	RELATE ONE:C42([CREDIT_STAGES:54]Document_Code:5)
Else 
	If (Count parameters:C259>=2)
		
		If (([CREDIT_STAGES:54]Document_Code:5#"") & (($2->="AUTO") | (Character code:C91(vLetterCode)=64) | (vLetterCode="")))
			RELATE ONE:C42([CREDIT_STAGES:54]Document_Code:5)
		Else 
			
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$2->)  //MMLetterCode
		End if 
	Else 
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=vLetterCode)
	End if 
	
End if 
$0:=False:C215
If (Count parameters:C259>=1)
	If (Not:C34($1))
		If (Records in selection:C76([DOCUMENTS:7])=1)
			Case of 
				: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=0)
					
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					Let_No("M")
					Set_DocumentCode(2; "M"; DOC_t_DocumentCode)  //we have a copy of the document now
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Document_Status:15:=0
					[DOCUMENTS:7]Document_Class:14:=-(Abs:C99([DOCUMENTS:7]Document_Class:14))
					DB_SaveRecord(->[DOCUMENTS:7])
					$2->:=[DOCUMENTS:7]Document_Code:1
					[DIARY:12]Document_Code:15:=[DOCUMENTS:7]Document_Code:1
					$0:=True:C214
			End case 
			
		End if 
	Else 
		$0:=$1
		
	End if 
End if 
Letter_Load
ERR_MethodTrackerReturn("Letter_LoadI"; $_t_oldMethodName)