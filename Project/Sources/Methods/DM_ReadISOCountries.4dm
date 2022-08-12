//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ReadISOCountries
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 22:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AttributeNames; 0)
	ARRAY TEXT:C222($_at_AttributeValues; 0)
	//ARRAY TEXT(DM_at_CountryCodes;0)
	//ARRAY TEXT(DM_at_CountryNames;0)
	C_BOOLEAN:C305($_bo_DataOpen; $_bo_RecordOpen; $_bo_Standalone)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_CountryCode; $_t_CountryName; $_t_DocumentPath; $_t_ElementName; $_t_Encoding; $_t_oldMethodName; $_t_StructurePath; $_t_ThisElementName; $_t_ThisElementPrefix; $_t_Version)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DM_ReadISOCountries")

If (Application type:C494#4D Remote mode:K5:5)
	$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
	
Else 
	$_t_StructurePath:=Get 4D folder:C485(4D Client database folder:K5:13)
End if 
If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")=Is a folder:K24:2))
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources")
	End if 
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")
	End if 
End if 
$_t_DocumentPath:=$_t_StructurePath+"Resources"+Folder separator:K24:12+"Data"+Folder separator:K24:12+"Countries"+".xml"
If (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
	
	$_bo_DataOpen:=False:C215
	$_t_ElementName:=""
	$_bo_RecordOpen:=False:C215
	$_ti_DocumentRef:=Open document:C264($_t_DocumentPath; "xml"; Read mode:K24:5)
	ARRAY TEXT:C222(DM_at_CountryCodes; 0)
	ARRAY TEXT:C222(DM_at_CountryNames; 0)
	If ($_ti_DocumentRef#?00:00:00?)
		If (OK=1)
			Repeat 
				$_l_event:=SAX Get XML node:C860($_ti_DocumentRef)
				Case of 
					: ($_l_event=XML start document:K45:7)
						$_t_Encoding:=""
						$_t_Version:=""
						$_bo_Standalone:=True:C214
						SAX GET XML DOCUMENT VALUES:C873($_ti_DocumentRef; $_t_Encoding; $_t_Version; $_bo_Standalone)
					: ($_l_event=XML DATA:K45:12)
						Case of 
							: ($_t_ElementName="COUNTRY") & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_CountryName:=""
								SAX GET XML ELEMENT VALUE:C877($_ti_DocumentRef; $_t_CountryName)
								
							: ($_t_ElementName="CODE") & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_CountryCode:=""
								SAX GET XML ELEMENT VALUE:C877($_ti_DocumentRef; $_t_CountryCode)
								
						End case 
					: ($_l_event=XML CDATA:K45:13)
						
					: ($_l_event=XML end element:K45:11)
						ARRAY TEXT:C222($_at_AttributeNames; 0)
						ARRAY TEXT:C222($_at_AttributeValues; 0)
						$_t_ThisElementPrefix:=""
						SAX GET XML ELEMENT:C876($_ti_DocumentRef; $_t_ThisElementName; $_t_ThisElementPrefix; $_at_AttributeNames; $_at_AttributeValues)
						Case of 
							: (Position:C15("List"; $_t_ThisElementName)>0) & ($_bo_DataOpen=True:C214)
								$_bo_DataOpen:=False:C215
								$_t_ElementName:=""
							: (Position:C15("Entry"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214)
								$_bo_RecordOpen:=False:C215
								$_t_ElementName:=""
								If ($_t_CountryName#"") & ($_t_CountryCode#"")
									If (Position:C15("CÔTE"; $_t_CountryName)>0)
										$_t_CountryName:="Ivory Coast"
									End if 
									APPEND TO ARRAY:C911(DM_at_CountryCodes; $_t_CountryCode)
									APPEND TO ARRAY:C911(DM_at_CountryNames; $_t_CountryName)
								End if 
							: (Position:C15("Country_name"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:=""
							: (Position:C15("Alpha"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:=""
								
						End case 
						
					: ($_l_event=XML entity:K45:14)
						//TRACE
					: ($_l_event=XML processing instruction:K45:9)
						//TRACE
					: ($_l_event=XML start element:K45:10)
						ARRAY TEXT:C222($_at_AttributeNames; 0)
						ARRAY TEXT:C222($_at_AttributeValues; 0)
						$_t_ThisElementPrefix:=""
						SAX GET XML ELEMENT:C876($_ti_DocumentRef; $_t_ThisElementName; $_t_ThisElementPrefix; $_at_AttributeNames; $_at_AttributeValues)
						Case of 
							: (Position:C15("List"; $_t_ThisElementName)>0) & ($_bo_DataOpen=False:C215)
								If ($_at_AttributeNames{1}="xml:lang") & ($_at_AttributeValues{1}="EN")
									$_bo_DataOpen:=True:C214
								End if   //SAX GET XML ELEMENT VALUE($_ti_DocumentRef;
								
							: (Position:C15("Entry"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=False:C215) & ($_bo_DataOpen=True:C214)
								$_bo_RecordOpen:=True:C214
								$_t_CountryCode:=""
								$_t_CountryName:=""
							: (Position:C15("Country_name"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:="COUNTRY"
							: (Position:C15("Alpha"; $_t_ThisElementName)>0) & ($_bo_RecordOpen=True:C214) & ($_bo_DataOpen=True:C214)
								$_t_ElementName:="CODE"
								
								//Country_name
						End case 
					: ($_l_event=XML comment:K45:8)
						//TRACE
				End case 
			Until ($_l_event=XML end document:K45:15)
		End if 
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("DM_ReadISOCountries"; $_t_oldMethodName)