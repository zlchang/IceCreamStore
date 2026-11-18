/**
 * File: ice-cream-store-utils.cc
 * -------------------------------
 * Defines module state needed to generate random
 * numbers in a multithreaded environment.
 */

#include <mutex>
#include <thread>
#include <iostream>
#include <string>
#include <random>
#include <chrono>

using namespace std;

// The range of ice cream cones that a customer may order
static const size_t kMinConeOrder = 1;
static const size_t kMaxConeOrder = 4;

/* The range of time, in milliseconds, that a customer could
 * browse for before joining clerks.
 */
static const size_t kMinBrowseTimeMS = 100;
static const size_t kMaxBrowseTimeMS = 300;

/* The range of time, in milliseconds, that a clerk could
 * take to make an ice cream cone.
 */
static const size_t kMinPrepTimeMS = 50;
static const size_t kMaxPrepTimeMS = 300;

/* The range of time, in milliseconds, that a manager could
 * take to inspect an ice cream cone.
 */
static const size_t kMinInspectionTimeMS = 20;
static const size_t kMaxInspectionTimeMS = 100;

// The probability that the manager approves a given ice cream cone
static const double kConeApprovalProbability = 0.3;

// We share one random generator, so we need a lock for accessing it.
static mutex rgenLock;
static std::random_device rd;
static std::mt19937 rgen(rd());

static size_t getBrowseTimeMS() {
  unique_lock<mutex> rgenUniqueLock(rgenLock);
  uniform_int_distribution<size_t> distr(kMinBrowseTimeMS, kMaxBrowseTimeMS);
  size_t value = distr(rgen);
  return value;
}

static size_t getPrepTimeMS() {
  unique_lock<mutex> rgenUniqueLock(rgenLock);
  uniform_int_distribution<size_t> distr(kMinPrepTimeMS, kMaxPrepTimeMS);
  size_t value = distr(rgen);
  return value;
}

static size_t getInspectionTimeMS() {
  unique_lock<mutex> rgenUniqueLock(rgenLock);
  uniform_int_distribution<size_t> distr(kMinInspectionTimeMS, kMaxInspectionTimeMS);
  size_t value = distr(rgen);
  return value;
}

static bool getInspectionOutcome() {
  unique_lock<mutex> rgenUniqueLock(rgenLock);
  std::bernoulli_distribution distr(kConeApprovalProbability);
  size_t value = distr(rgen);
  return value;
}

size_t getNumCones() {
  unique_lock<mutex> rgenUniqueLock(rgenLock);
  uniform_int_distribution<size_t> distr(kMinConeOrder, kMaxConeOrder);
  size_t value = distr(rgen);
  return value;
}

void browse() {
  printf("Customer starts to kill time.\n");
  size_t browseTimeMS = getBrowseTimeMS();
  this_thread::sleep_for(chrono::milliseconds(browseTimeMS));
  printf("Customer just killed %lf seconds.\n", double(browseTimeMS) / 1000);
}

void makeCone(size_t coneID, size_t customerID) {
  printf("    Clerk starts to make ice cream cone #%zu for customer #%zu.\n", 
  coneID, customerID);
  size_t prepTimeMS = getPrepTimeMS();
  this_thread::sleep_for(chrono::milliseconds(prepTimeMS));
  printf("    Clerk just spent %lf seconds making ice cream cone #%zu for customer #%zu.\n", 
  double(prepTimeMS) / 1000, coneID, customerID);
}

bool inspectCone() {
  printf("  Manager is presented with an ice cream cone.\n"); 

  // Sleep for some random amount of time to simulate inspecting the cone
  size_t inspectionTimeMS = getInspectionTimeMS();
  this_thread::sleep_for(chrono::milliseconds(inspectionTimeMS));

  // Generate an inspection decision
  bool passed = getInspectionOutcome();
  string verb = passed ? "APPROVED" : "REJECTED";
  printf("  Manager spent %lf seconds analyzing presented ice cream cone and %s it\n",
  double(inspectionTimeMS) / 1000, verb.c_str());
  return passed;
}
