/* This is free and unencumbered software released into the public domain. */

package org.conreality.sdk;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.util.ArrayList;
import java.util.List;

/** PeerService */
public final class PeerService extends Service {
  private static final String TAG = "PeerService";

  public final class LocalBinder extends Binder {
    public @NonNull PeerService getService() {
      return PeerService.this;
    }
  }

  private final @NonNull IBinder binder = new LocalBinder();
  private @Nullable PeerMesh peerMesh;

  /** Implements Service#onBind(). */
  @Override
  public @NonNull IBinder onBind(final @NonNull Intent intent) {
    return this.binder;
  }

  /** Implements Service#onCreate(). */
  @Override
  public void onCreate() {
    Log.i(TAG, "Created the bound service.");
  }

  public void onConnection(final @NonNull Context context) {
    assert(context != null);
    this.peerMesh = new PeerMesh(context);
  }

  /** Implements Service#onDestroy(). */
  @Override
  public void onDestroy() {
    Log.d(TAG, "Terminating the bound service...");
    if (this.peerMesh != null) {
      this.peerMesh.stop();
      this.peerMesh = null;
    }
    Log.i(TAG, "Terminated the bound service.");
  }

  /** Implements Service#onStartCommand(). */
  @Override
  public int onStartCommand(final @NonNull Intent intent, final int flags, final int startID) {
    assert(intent != null);

    final String action = (intent != null) ? intent.getAction() : null;
    if (Log.isLoggable(TAG, Log.DEBUG)) {
      Log.d(TAG, String.format("PeerService.onStartCommand: intent=%s flags=%d startID=%d action=%s", intent, flags, startID, action));
    }
    switch (action) {
      default:
    }
    return START_REDELIVER_INTENT;
  }

  public void start() {
    if (this.peerMesh != null) {
      this.peerMesh.start();
    }
  }

  public void stop() {
    if (this.peerMesh != null) {
      this.peerMesh.stop();
    }
  }

  public List<Peer> getPeers() {
    if (this.peerMesh != null) {
      return this.peerMesh.registry.toList();
    }
    return new ArrayList<Peer>();
  }
}
