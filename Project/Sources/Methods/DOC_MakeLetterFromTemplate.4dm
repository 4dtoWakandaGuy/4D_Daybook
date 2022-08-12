//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_MakeLetterFromTemplate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    03/06/2010 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IsUnique; $_l_TemplateSize; WriteOffscreen)
	C_TEXT:C284($_t_DocumentCode; $_t_FormName; $_t_oldMethodName; $_t_TemplateReference; $0; $1; $2; DOC_t_DocumentCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_MakeLetterFromTemplate")

//This method-encapsulates some functions that we have been doing in various places-this makes it consistent and is applied where ever a document reference is put onto a diary.
//If the document reference is a template this will duplicate the template to create a document and return the document code of the new record
$0:=""
If (Count parameters:C259>=1)
	If ($1#"")
		$_t_TemplateReference:=$1
		If ([DOCUMENTS:7]Document_Code:1#$_t_TemplateReference)
			QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_TemplateReference)
			
		End if 
		If ([DOCUMENTS:7]Document_Code:1=$_t_TemplateReference)
			Case of 
				: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=4D Write Email Template) | ([DOCUMENTS:7]Document_Class:14=4D Write ReportTemplate)
					
					
					
					
					$_l_TemplateSize:=Picture size:C356([DOCUMENTS:7]Write_:5)
					WR PICTURE TO AREA:P12000:141(WriteOffscreen; [DOCUMENTS:7]Write_:5)
					READ WRITE:C146([DOCUMENTS:7])
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					DelayTicks(30)
					Repeat 
						$_t_DocumentCode:=Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1)
						SET QUERY DESTINATION:C396(3; $_l_IsUnique)
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
						If ($_l_IsUnique=0)
							DOC_t_DocumentCode:=$_t_DocumentCode
						End if 
						SET QUERY DESTINATION:C396(0)
					Until ($_l_IsUnique=0)
					If (Count parameters:C259>=2)
						$_t_FormName:=$2
					Else 
						$_t_FormName:=""
					End if 
					If ($_t_FormName="Q@")
						Set_DocumentCode(2; "Q"; DOC_t_DocumentCode)
					Else 
						Set_DocumentCode(2; "L"; DOC_t_DocumentCode)
					End if 
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
					$0:=[DOCUMENTS:7]Document_Code:1
					//[DOCUMENTS]Heading:=[DOCUMENTS]Heading+"(Letter)"
					[DOCUMENTS:7]Heading:2:=[DOCUMENTS:7]Heading:2  //got rid of "(Letter)" 24/09/08 -kmw
					[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
					[DOCUMENTS:7]Document_Status:15:=1
					
					DB_SaveRecord(->[DOCUMENTS:7])
					
					
				: ([DOCUMENTS:7]Document_Class:14=SuperReport Email Template)
				: ([DOCUMENTS:7]Document_Class:14=SuperReport Letter Template)
				: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
				: ([DOCUMENTS:7]Document_Class:14=Text Email Template) | ([DOCUMENTS:7]Document_Class:14=Text Letter Template) | ([DOCUMENTS:7]Document_Class:14=Text Report Template)
					
					
					
					
					READ WRITE:C146([DOCUMENTS:7])
					DUPLICATE RECORD:C225([DOCUMENTS:7])
					
					Repeat 
						$_t_DocumentCode:=Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1)
						SET QUERY DESTINATION:C396(3; $_l_IsUnique)
						QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
						If ($_l_IsUnique=0)
							DOC_t_DocumentCode:=$_t_DocumentCode
						End if 
						SET QUERY DESTINATION:C396(0)
					Until ($_l_IsUnique=0)
					Case of 
						: ([DOCUMENTS:7]Document_Class:14=Text Email Template)
							
							Set_DocumentCode(2; "E"; DOC_t_DocumentCode)
						: ([DOCUMENTS:7]Document_Class:14=Text Letter Template)
							Set_DocumentCode(2; "T"; DOC_t_DocumentCode)
							//: ([DOCUMENTS]Document_Class=Text Letter Template )
						: ([DOCUMENTS:7]Document_Class:14=Text Report Template)  //fixed typo 23/09/08 -kmw
							Set_DocumentCode(2; "R"; DOC_t_DocumentCode)
					End case 
					[DOCUMENTS:7]Standard:9:=False:C215
					[DOCUMENTS:7]Export:6:=Export_Stamp2([DOCUMENTS:7]Export:6)
					$0:=[DOCUMENTS:7]Document_Code:1
					//[DOCUMENTS]Heading:=[DOCUMENTS]Heading+"(Email)"
					[DOCUMENTS:7]Heading:2:=[DOCUMENTS:7]Heading:2  //got rid of "(Email)" 24/09/08 -kmw
					[DOCUMENTS:7]Document_Class:14:=-([DOCUMENTS:7]Document_Class:14)
					[DOCUMENTS:7]Document_Status:15:=1
					
					DB_SaveRecord(->[DOCUMENTS:7])
					
				Else 
					$0:=$1  // it is not a template reference
			End case 
			
		Else 
			//the template referred to must not exist
			$0:=$1
		End if 
	Else 
	End if 
End if 
ERR_MethodTrackerReturn("DOC_MakeLetterFromTemplate"; $_t_oldMethodName)