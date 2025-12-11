package com

fun main() {
    val profile = System.getProperty("app.profile")
    val serverPort = System.getProperty("server.port")

    println(
        """
        Profile: $profile
        Server Port: $serverPort
        """.trimIndent(),
    )
}
