
view: low_performing {
  derived_table: {
    sql: SELECT 
        apMac,
        new_zone,
        clientMac,
        new_ssid,
        ipAddress,
        sessionStartTimeDate,
        rssi,
        snr,
        txRatebps,
        medianTxMCSRate,
        medianRxMCSRate
      FROM 
        `datawifi.aggregate` -- Replace with your project, dataset, and table
      WHERE
        -- Conditions to filter for low performance:
        rssi < -70  -- Adjust the RSSI threshold as needed 
        AND snr < 25 -- Adjust the SNR threshold as needed
        AND txRatebps < 5000000 -- Adjust the transmission rate threshold (e.g., 5 Mbps)
        AND medianTxMCSRate < 5  -- Adjust MCS rate thresholds if needed
        AND medianRxMCSRate < 5 
        AND
        -- Filter for the date range:
        sessionStartTimeDate >= TIMESTAMP('2024-02-04 00:00:00') -- Start of Feb 1st, 2024
        AND sessionStartTimeDate < TIMESTAMP('2024-02-05 00:00:00') -- End of Feb 4th, 2024 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ap_mac {
    type: string
    sql: ${TABLE}.apMac ;;
  }

  dimension: new_zone {
    type: string
    sql: ${TABLE}.new_zone ;;
  }

  dimension: client_mac {
    type: string
    sql: ${TABLE}.clientMac ;;
  }

  dimension: new_ssid {
    type: string
    sql: ${TABLE}.new_ssid ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ipAddress ;;
  }

  dimension_group: session_start_time_date {
    type: time
    sql: ${TABLE}.sessionStartTimeDate ;;
  }

  dimension: rssi {
    type: number
    sql: ${TABLE}.rssi ;;
  }

  dimension: snr {
    type: number
    sql: ${TABLE}.snr ;;
  }

  dimension: tx_ratebps {
    type: number
    sql: ${TABLE}.txRatebps ;;
  }

  dimension: median_tx_mcsrate {
    type: number
    sql: ${TABLE}.medianTxMCSRate ;;
  }

  dimension: median_rx_mcsrate {
    type: number
    sql: ${TABLE}.medianRxMCSRate ;;
  }

  set: detail {
    fields: [
        ap_mac,
	new_zone,
	client_mac,
	new_ssid,
	ip_address,
	session_start_time_date_time,
	rssi,
	snr,
	tx_ratebps,
	median_tx_mcsrate,
	median_rx_mcsrate
    ]
  }
}
