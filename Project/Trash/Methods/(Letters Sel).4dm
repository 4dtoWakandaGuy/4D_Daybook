//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   03/06/2010 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DocumentTemplateClasses;0)
	C_BOOLEAN:C305($2; SRCH_bo_AutoSearch)
	C_LONGINT:C283(vTr; WS_l_SelDocTemplateClass; xNext)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; $_t_SearchAt; $1; VSELPREV; WS_t_DocumentTemplateClass)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters Sel")
//Letters Sel - see also Reports_Sel
If (Count parameters:C259>=1)
	$_t_Search:="Letter: "+$1
Else 
	$_t_Search:=""
End if 
If (Count parameters:C259>=2)
	SRCH_bo_AutoSearch:=$2
Else 
	SRCH_bo_AutoSearch:=False:C215
End if 
$_t_Search:=Gen_Search("Document Code, Description or Person to find:"; vSelPrev; "Find Templates"; $_t_Search)
If (OK=0)
	vTr:=0
Else 
	If (xNext=0)
		vSelPrev:=$_t_Search
		Letters_Sel2($_t_Search)
		Case of 
			: (WS_l_SelDocTemplateClass=1)  //letter templates
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template; *)
				QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]X_Template_Type:30=0)
				WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
				QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=0; *)
			: (WS_l_SelDocTemplateClass=2)  //superreporttemplates
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
				WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
			: (WS_l_SelDocTemplateClass=3)  //email templates
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=Text Email Template; *)
				QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]X_Template_Type:30=0)
				WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
			: (WS_l_SelDocTemplateClass=5) | (WS_l_SelDocTemplateClass=0)  //others
				QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=0)
				WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
		End case 
		
		QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Status:15>=(-100))
		
	Else 
		QUERY:C277([DOCUMENTS:7])
		If (OK=1)
			Case of 
				: (WS_l_SelDocTemplateClass=1)
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template; *)
					QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]X_Template_Type:30=0; *)
					WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
					QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Table_Number:11=0; *)
				: (WS_l_SelDocTemplateClass=2)  //superreporttemplates
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=SuperReportReport Template; *)
					WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
				: (WS_l_SelDocTemplateClass=3)  //email templates
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=Text Email Template; *)
					QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]X_Template_Type:30=0; *)
					WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
				: (WS_l_SelDocTemplateClass=5) | (WS_l_SelDocTemplateClass=0)  //others
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=0; *)
					WS_t_DocumentTemplateClass:=WS_at_DocumentTemplateClasses{WS_l_SelDocTemplateClass}
			End case 
			
			QUERY SELECTION:C341([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Status:15>-100)
		Else 
			vTr:=0
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Letters Sel"; $_t_oldMethodName)