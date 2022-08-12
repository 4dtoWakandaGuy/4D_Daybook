//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail MSBagLab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(j)
	C_TEXT:C284($_t_oldMethodName; $_t_Search; vDetails; vOurRef; vProdName; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail MSBagLab")
If (Not:C34(End selection:C36([MAILSORT_MAIL:83])))
	If (j=1)
		If ([MAILSORT_MAIL:83]SSC:3="@XX")
			$_t_Search:=Substring:C12([MAILSORT_MAIL:83]SSC:3; 1; 3)
		Else 
			$_t_Search:=[MAILSORT_MAIL:83]SSC:3
		End if 
		QUERY:C277([MAILSORT_B:78]; [MAILSORT_B:78]SSC:2=$_t_Search)
		If (Records in selection:C76([MAILSORT_B:78])>0)
			vDetails:=[MAILSORT_B:78]SSC:2+Char:C90(13)
			vT:=[MAILSORT_B:78]Label:3
			vDetails:=vDetails+First_Field(->vT; "  ")+Char:C90(13)
			RemoveLeadTr(vT; ->vT)
			vDetails:=vDetails+First_Field(->vT; "  ")
			vDetails:=vDetails+(" "*20)+vT+Char:C90(13)+Char:C90(13)+vOurRef+(" "*20)+vProdName
		End if 
	End if 
	If (j>=[MAILSORT_MAIL:83]Bags:6)
		NEXT RECORD:C51([MAILSORT_MAIL:83])
		j:=1
	Else 
		j:=j+1
	End if 
End if 
ERR_MethodTrackerReturn("Mail MSBagLab"; $_t_oldMethodName)