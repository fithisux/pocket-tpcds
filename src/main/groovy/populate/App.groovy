package populate

import groovy.sql.Sql
import groovy.util.logging.Slf4j
import org.postgresql.copy.CopyManager

@Slf4j
class App {

    public static String[] TABLE_NAMES = [
            'item',
            'date_dim',
            'time_dim',
            'warehouse',
            'ship_mode',
            'income_band',
            'customer_demographics',
            'web_site',
            'call_center',
            'customer_address',
            'promotion',
            'reason',
            'household_demographics',
            'customer',
            'web_page',
            'catalog_page',
            'store',
            'inventory',
            'web_sales',
            'web_returns',
            'catalog_sales',
            'catalog_returns',
            'store_sales',
            'store_returns',
            'dbgen_version'
    ]

    Sql sqlInstance

    App() {
        Properties p = new Properties()
        p.load(App.getResourceAsStream('/db.properties'))
        ConfigObject configObject =  new groovy.util.ConfigSlurper().parse(p)
        println(configObject)
        def db = [
                url:"jdbc:postgresql:${configObject.serverDatabase}",
                user: configObject.serverUser,
                password: configObject.serverPassword,
                driver:'org.postgresql.Driver'
        ]

        println([db.url, db.user, db.password, db.driver])
        sqlInstance  = Sql.newInstance(db.url, db.user, db.password, db.driver)
    }

    void insertQuery(String tableName, String csvData) {
        String[] rows = csvData.split("\\|\\n")
        // println rows.first().split('\\|')
        csvData = rows.join('\n')
        long rowsInserted = new CopyManager(sqlInstance.connection)
                .copyIn("COPY ${tableName} FROM STDIN DELIMITER '|' NULL '';", new StringReader(csvData))
        log.info("Inserted ${rowsInserted} for ${tableName}")
    }

    static void main(String[] args) {
        App app = new App()
        println(app.sqlInstance)

        App.TABLE_NAMES.each {String tableName ->
            String fullTableName = "tcpds_2_1_0.${tableName}"
            println "Populating ${fullTableName}"
            app.sqlInstance.execute('DELETE FROM ' + fullTableName)
            String csvData = App.getResourceAsStream("/dataset/${tableName}.dat").text
            app.insertQuery(fullTableName, csvData)
        }
    }
}