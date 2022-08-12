//%attributes = {}
If (False:C215)
	//Project Method Name:      TEMP_DBPmacro
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TEMP_DBPmacro")

//DBP_UpdateOrCreateQuoteProducts
//
//Added 15/07/08 -kmw in order to speed up setting up data...
//... (may or may not be re-usable by DBP at a later time but...
//... that wasn't the point of its creation).

//
//Builds Quote Products and Brands based on Quote Product Groups.
//Expects Groups to be formatted in certain way
//
//Although it saves time it doesn't set prices (this has to be done manually)
//
//Gen_Confirm ("This function will create Brands and Quote Products based on Product Gr"+"oups. Continue?)"
//
//If (OK=1)
//READ ONLY([GROUPS])
//  `Find Product Groups used by Group field of Covers Quote Products...
//  `...and make sure they have their matching Brand codes...
//  `...which hold the equivalent info on Book Products except this Time_In...
//  `...the Brand field.
//READ WRITE([BRANDS])
//QUERY([GROUPS];[GROUPS]Group Code="G@";*)
//QUERY([GROUPS]; | ;[GROUPS]Group Code="M@")
//C_LONGINT(m_i)
//For (m_i;1;Records in selection([GROUPS]))
//QUERY([BRANDS];[BRANDS]Brand Code=[GROUPS]Group Code)
//If (Records in selection([BRANDS])<1)
//CREATE RECORD([BRANDS])
//[BRANDS]Brand Code:=[GROUPS]Group Code
//[BRANDS]Brand Name:=[GROUPS]Group Name
//SAVE RECORD([BRANDS])
//End if
//NEXT RECORD([GROUPS])
//End for
//UNLOAD RECORD([BRANDS])
//READ ONLY([BRANDS])
//  `
//  `Find Product Groups used by Group field of Covers Quote Products...
//  `...and also Paper Quote Products and make sure they have their...
//  `...matching Quote Products
//READ WRITE([PRODUCTS])
//QUERY([GROUPS];[GROUPS]Group Code="G@")
//C_LONGINT(m_i)
//For (m_i;1;Records in selection([GROUPS]))
//QUERY([PRODUCTS];[PRODUCTS]Group Code=[GROUPS]Group Code)
//If (Records in selection([PRODUCTS])<1)
//CREATE RECORD([PRODUCTS])
//[PRODUCTS]Group Code:=[GROUPS]Group Code
//[PRODUCTS]Brand Code:="QUO"
//[PRODUCTS]Model Code:="GLOSSCOVERQUOTE"
//[PRODUCTS]Product Code:=[PRODUCTS]Group Code+[PRODUCTS]Brand Code+[PRODUCTS]Model Code
//[PRODUCTS]Product Name:=[GROUPS]Group Name
//[PRODUCTS]Description:=[GROUPS]Group Comments
//SAVE RECORD([PRODUCTS])
//End if
//NEXT RECORD([GROUPS])
//End for
//
//QUERY([GROUPS];[GROUPS]Group Code="M@")
//C_LONGINT(m_i)
//For (m_i;1;Records in selection([GROUPS]))
//QUERY([PRODUCTS];[PRODUCTS]Group Code=[GROUPS]Group Code)
//If (Records in selection([PRODUCTS])<1)
//CREATE RECORD([PRODUCTS])
//[PRODUCTS]Group Code:=[GROUPS]Group Code
//[PRODUCTS]Brand Code:="QUO"
//[PRODUCTS]Model Code:="MATTCOVERQUOTE"
//[PRODUCTS]Product Code:=[PRODUCTS]Group Code+[PRODUCTS]Brand Code+[PRODUCTS]Model Code
//[PRODUCTS]Product Name:=[GROUPS]Group Name
//[PRODUCTS]Description:=[GROUPS]Group Comments
//SAVE RECORD([PRODUCTS])
//End if
//NEXT RECORD([GROUPS])
//End for
//
//QUERY([GROUPS];[GROUPS]Group Code="@C@")
//C_LONGINT(m_i)
//For (m_i;1;Records in selection([GROUPS]))
//QUERY([PRODUCTS];[PRODUCTS]Group Code=[GROUPS]Group Code)
//If (Records in selection([PRODUCTS])<1)
//CREATE RECORD([PRODUCTS])
//[PRODUCTS]Group Code:=[GROUPS]Group Code
//[PRODUCTS]Brand Code:="QUO"
//[PRODUCTS]Model Code:="COLOURPAGEQUOTE"
//[PRODUCTS]Product Code:=[PRODUCTS]Group Code+[PRODUCTS]Brand Code+[PRODUCTS]Model Code
//[PRODUCTS]Product Name:=[GROUPS]Group Name
//[PRODUCTS]Description:=[GROUPS]Group Comments
//SAVE RECORD([PRODUCTS])
//End if
//NEXT RECORD([GROUPS])
//End for
//
//QUERY([GROUPS];[GROUPS]Group Code="@B@")
//C_LONGINT(m_i)
//For (m_i;1;Records in selection([GROUPS]))
//QUERY([PRODUCTS];[PRODUCTS]Group Code=[GROUPS]Group Code)
//If (Records in selection([PRODUCTS])<1)
//CREATE RECORD([PRODUCTS])
//[PRODUCTS]Group Code:=[GROUPS]Group Code
//[PRODUCTS]Brand Code:="QUO"
//[PRODUCTS]Model Code:="BLACKPAGEQUOTE"
//[PRODUCTS]Product Code:=[PRODUCTS]Group Code+[PRODUCTS]Brand Code+[PRODUCTS]Model Code
//[PRODUCTS]Product Name:=[GROUPS]Group Name
//[PRODUCTS]Description:=[GROUPS]Group Comments
//SAVE RECORD([PRODUCTS])
//End if
//NEXT RECORD([GROUPS])
//End for
//
//UNLOAD RECORD([PRODUCTS])
//READ ONLY([PRODUCTS])
//
//Gen_Alert ("Finished creating brands and quote products.")
//
//End if
ERR_MethodTrackerReturn("TEMP_DBPmacro"; $_t_oldMethodName)