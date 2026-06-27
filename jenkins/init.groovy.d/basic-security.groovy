#!groovy

import jenkins.model.*
import hudson.security.*

// מקבלים את האובייקט הראשי של Jenkins
def instance = Jenkins.getInstance()

// יוצרים אסטרטגיית אבטחה בסיסית עם משתמש אחד
def hudsonRealm = new HudsonPrivateSecurityRealm(false)

// יצירת משתמש אדמין (שנה את הסיסמה!)
hudsonRealm.createAccount("admin", "admin123")

// מגדירים את ה־Realm למערכת
instance.setSecurityRealm(hudsonRealm)

// מגדירים הרשאות — FullControl למשתמשים מחוברים בלבד
def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)

// מיישמים את אסטרטגיית ההרשאות
instance.setAuthorizationStrategy(strategy)

// שומרים את השינויים
instance.save()
