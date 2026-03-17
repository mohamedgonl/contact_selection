package com.example.refselect.constant;

/**
 * Application constants for Contact Selection system.
 */
public final class AppConstants {

    // Common Flags
    public static final String DELETE_FLG_OFF = "0";
    public static final String DELETE_FLG_ON = "1";
    public static final String RGON_USE_TYP_ACTIVE = "1";

    // Search Logic
    public static final int SEARCH_LIMIT = 80;
    public static final int KIND_REF_SINGLE = 0;
    public static final String URL_SEPARATOR = " / ";

    // Message IDs
    public static final String MSG_ERROR_NO_RESULTS = "SE4101_00040";
    public static final String MSG_WARN_LIMIT_EXCEEDED = "SI4101_00063";
    public static final String MSG_ERROR_SINGLE_SELECT_ONLY = "SE4102_00166";

    private AppConstants() {
        // Private constructor to prevent instantiation
    }
}
